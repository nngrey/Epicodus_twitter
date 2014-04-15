class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :handle, presence: true, uniqueness: true

  before_validation :send_welcome_message #, other callbacks..

  def send_welcome_message
   UserMailer.signup_confirmation(self)
  end


end
