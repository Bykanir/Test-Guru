class Admin::BaseController < ApplicationController

  layout 'admin'

  before_action :authenticate_user!
  before_action :admmin_required!

  private

  def admmin_required!
    redirect_to root_path, alert: 'You are not authorized to view this page.' unless current_user.is_a?(Admin)
  end

end
