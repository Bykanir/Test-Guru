class FeedbackMailer < ApplicationMailer
  ADMIN_EMAIL = "tgurumail@gmail.com"

  def feedback_mail(info)
    @text = info[:text]
    @user = info[:email]
    
    mail to: ADMIN_EMAIL
  end
end
