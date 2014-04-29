class Notification < ActiveRecord::Base
  belongs_to :user

  paginates_per 10

  # Validations
  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true

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

  def anchor
    "notification-#{id}"
  end
end
