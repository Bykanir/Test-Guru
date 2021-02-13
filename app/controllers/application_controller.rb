# frozen_string_literal: true

class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
   stored_location_for(:admin) ||
      if resource.is_a?(Admin)
        admin_tests_path
      else
        super
      end
  end
  
end
