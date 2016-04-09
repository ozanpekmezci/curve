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
    #if Chat.between(params[:sender_id],params[:recipient_id]).present?
    #  @chat = Chat.between(params[:sender_id],params[:recipient_id]).first
    #else
    if @chat = Chat.create!(sender_id: current_user.id, recipient_id: params[:id])
      Notification.create(recipient: @chat.recipient, actor: @chat.sender, action: "posted",notifiable: @chat)
    end
    @receiver = interlocutor(@chat)
    @fires = @chat.fires
    @fire = Fire.new
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
