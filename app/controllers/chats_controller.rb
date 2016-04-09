class ChatsController < ApplicationController

  before_filter :authenticate_user!
  def new
    @chosen_recipient = User.find_by(id: params[:id].to_i) if params[:id]
  end

  def create
    if Chat.between(params[:sender_id],params[:recipient_id]).present?
      @chat = Chat.between(params[:sender_id],params[:recipient_id]).first
    else
      @chat = Chat.create!(chat_params)
    end
  end

  ##FIXME: redundant, between olayini cöz
  def initiate
    @comment = Comment.find(params[:id])
    @chat = Chat.between(current_user.id,@comment.user_id, @comment.id)
    unless @chat.empty?
      #@chat = Chat.between(params[:sender_id],params[:recipient_id]).first
      redirect_to chat_path(@chat.id)
    else
      chat_between = Digest::SHA256.hexdigest("#{current_user.id}#{@comment.user_id}#{@comment.id}")
      if @chat = Chat.create!(sender_id: current_user.id, recipient_id: @comment.user_id, chathash: chat_between)
        Notification.create(recipient: @chat.recipient, actor: @chat.sender, action: "posted",notifiable: @chat)
      end
      redirect_to chat_path(@chat.id)
    end
  end

  def show
    @chat = Chat.find(params[:id])
    @receiver = interlocutor(@chat)
    @fires = @chat.fires
    @fire = Fire.new
  end

  private
  def chat_params
    params.permit(:sender_id, :recipient_id)
  end

  def interlocutor(chat)
    current_user == chat.recipient ? chat.sender : chat.recipient
  end
end
