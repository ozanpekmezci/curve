class FiresChannel < ApplicationCable::Channel
  def follow(data)
    stop_all_streams
    #stream_from 'demo_chan'
    stream_from "chats:#{data['chat_id'].to_i}"
  end

  def unfollow
    stop_all_streams
  end
  # subscribed ve unsubscribed otomatik cagiriliyo
  def subscribed
  	#stream_from 'demo_chan'
  end
end
