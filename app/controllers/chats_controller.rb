class ChatsController < ApplicationController
  before_filter :authenticate_user!
  def new
    @chosen_recipient = User.find_by(id: params[:to].to_i) if params[:to]
  end

  def create
    if Chat.between(params[:sender_id],params[:recipient_id]).present?
      @chat = Chat.between(params[:sender_id],params[:recipient_id]).first
    else
      @chat = Chat.create!(chat_params)
    end
  end

  ##FIXME: redundant
  def initiate
    if Chat.between(params[:sender_id],params[:recipient_id]).present?
      @chat = Chat.between(params[:sender_id],params[:recipient_id]).first
    else
      @chat = Chat.create!(chat_params)
    end
    Notification.create(recipient: @chat.recipient, actor: @chat.sender, action: "posted",notifiable: @chat)
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
