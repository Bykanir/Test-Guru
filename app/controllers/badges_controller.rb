class BadgesController < ApplicationController

  def index
    @badges = current_user.badge
    @all_badges = Badge.all
  end

end
