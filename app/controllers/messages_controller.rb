class MessagesController < ApplicationController
  before_action :authenticate_user!

  def new
  @chosen_recipient = User.find_by(id: params[:to].to_i) if params[:to]
end

  def create
    recipients = User.where(id: params['recipients'])
    message = current_user.send_message(recipients, params[:message][:body], params[:message][:subject])
    conversation = message.conversation
    flash[:success] = "Message has been sent!"
    redirect_to conversation_path(conversation)
    recipients.each do |user|
      Notification.create(recipient: user, actor: current_user, action: "posted",notifiable: message)
    end
  end
end
