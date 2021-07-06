class FeedbackMailer < ApplicationMailer
  EMAIL_ADMIN = "tgurumail@gmail.com"

  def feedback_mail(info)
    @text = info[:text]
    @user = info[:email]
    
    mail to: EMAIL_ADMIN
  end
end
