class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:return_to_url] || root_path
      cookies[:return_to_url] = nil
    else
      flash_alert_message
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    
    redirect_to login_path
  end
  
end
