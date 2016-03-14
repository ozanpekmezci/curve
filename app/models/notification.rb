class Notification < ActiveRecord::Base
  belongs_to :recipient, class_name: "User"
  belongs_to :actor, class_name: "User"
  belongs_to :notifiable, polymorphic: true
  #NOTE: cok basarili
  scope :unread, -> {where(read_at:nil)}
end
