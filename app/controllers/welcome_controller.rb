class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if current_user
      @user_welcome = current_user.first_name || current_user.email
    else
      @user_welcome = "Guest"
    end
  end


end
