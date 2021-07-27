class BadgesController < ApplicationController
  def index
    @badges = current_user.badges
    @all_badges = Badge.all
  end
end