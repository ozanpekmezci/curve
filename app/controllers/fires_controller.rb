class FiresController < ApplicationController
  before_filter :authenticate_user!

  def create
    @chat = Chat.find(params[:chat_id])
    @fire = @chat.fires.build(fire_params)
    @fire.user_id = current_user.id
    respond_to do |format|
      if @fire.save!
        format.js
        format.html
      end
    end
  end

  private

  def fire_params
    params.require(:fire).permit(:body)
  end
end
