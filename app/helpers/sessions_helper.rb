module SessionsHelper

  def flash_alert_message
    flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
  end
  
end
