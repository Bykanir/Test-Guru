# frozen_string_literal: true

module ApplicationHelper

  ALERTS = { 'notice' => 'alert-primary', 
              'alert' => 'alert-warning', 
              'succes' => 'alert-success', 
              'error' => 'alert-danger' }

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"    
  end

  def flash_message(key, message)
    content_tag :div, message, class: "alert #{ALERTS[key]}", role: "alert"
  end

end
