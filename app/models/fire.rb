class Fire < ApplicationRecord
  belongs_to :chat
  belongs_to :user

  validates_presence_of :body, :chat_id, :user_id
  after_commit { FireRelayJob.perform_later self }

end
