json.array! @notifications do |notification|
  json.id notification.id
  #json.recipient notification.recipient
  json.actor notification.actor.user_name
  json.action notification.action
  json.notifiable do #notification.notifiable
    if notification.notifiable.class.to_s.underscore.humanize.downcase == "mailboxer/receipt"
      json.type "a message"
    else
      json.type "a #{notification.notifiable.class.to_s.underscore.humanize.downcase}"
    end
  end
  if notification.notifiable.class.to_s.underscore.humanize.downcase == "mailboxer/receipt"
    json.url conversation_path(notification.notifiable.conversation, anchor: dom_id(notification.notifiable))
  elsif notification.notifiable.class.to_s.underscore.humanize.downcase == "chat"
    json.url chat_path(notification.notifiable)
  else
    json.url post_path(notification.notifiable.commentable, anchor: dom_id(notification.notifiable))
  end
end
