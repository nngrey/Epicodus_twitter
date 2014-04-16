class Tweet < ActiveRecord::Base
  belongs_to :user
  validates :content, presence: true

  after_create :notify_mentions

  def notify_mentions
    handles = User.all.pluck(:handle)
    handles.each do |handle|
      if self.content.include?(handle)
        user = User.find_by_handle(handle)
        UserMailer.notify(user, self).deliver
      end
    end
  end
end
