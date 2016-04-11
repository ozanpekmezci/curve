class NotificationsChannel < ApplicationCable::Channel
  def follow(data)
     #stream_from 'demo_chan'
    stop_all_streams
    stream_from "notifications_#{data['current_user_id'].to_i}"
  end

  def unfollow
    stop_all_streams
  end
  # subscribed ve unsubscribed otomatik cagiriliyo
  def subscribed
  	#stream_from 'demo_chan'
  end

end
