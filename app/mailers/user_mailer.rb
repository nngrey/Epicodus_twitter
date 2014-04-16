class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @user = user
    mail to: user.email, subject: "signup confirmation"
  end

  def notify(user, tweet)
    @tweet = tweet
    @user = user
    mail to: user.email, subject: "Someone tweeted about you."
  end

end
