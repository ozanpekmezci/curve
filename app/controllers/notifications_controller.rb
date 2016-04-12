class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = Notification.where(recipient: current_user).unread
  end

  def mark_as_read
    @notification = Notification.where(id: params[:id]).unread
    #@notifications = Notification.where(recipient: current_user).unread
    @notification.update(read_at: Time.zone.now)
    render json: {success: true}
  end

end
