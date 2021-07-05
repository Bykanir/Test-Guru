class FeedbacksController < ApplicationController

  def new; end

  def create
    FeedbackMailer.feedback_mail(feedback_params).deliver_now
    flash[:alert] = t('.sent')
    redirect_to root_path
  end

  private

  def feedback_params
    params.require(:feedback).permit(:text, :email)
  end

end
