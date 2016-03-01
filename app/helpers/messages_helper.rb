module MessagesHelper
  def recipients_options
    s = ''
    User.all.each do |user|
      s << "<option value='#{user.id}' data-img-src='#{ image_tag(user.avatar.url(:small_thumb)) if user.avatar?}'>#{user.name}</option>"
      s << "<option value='#{user.id}'>#{user.name}</option>"
    end
    s.html_safe
  end
end
