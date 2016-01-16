class CommentsChannel < ApplicationCable::Channel
  def follow(data)
    stop_all_streams
    stream_from 'demo_chan'
    #stream_from "posts:#{data['post_id'].to_i}:comments"
  end

  def unfollow
    stop_all_streams
  end
  # subscribed ve unsubscribed otomatik cagiriliyo
  def subscribed
  	stream_from 'demo_chan'
  end
  def speak(data)
  	ActionCable.server.broadcast 'demo_chan', comment: data['comment']
  end
end