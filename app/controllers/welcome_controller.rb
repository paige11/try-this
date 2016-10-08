class WelcomeController < ApplicationController
  def home
    @username = current_user.first_name || current_user.email
  end


end
