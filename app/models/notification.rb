class Notification < ActiveRecord::Base
  belongs_to :user

  scope :unread, -> { where(read: false) }

  after_create :push_to_client
  def push_to_client
    message = {
      title: self.title,
      content: self.content,
      path: self.path
    }
    FayeClient.publish("/notify/#{self.user.temp_access_token}", message)
  end
end
