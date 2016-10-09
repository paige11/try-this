class WelcomeController < ApplicationController
  def home
    @user_welcome = current_user.first_name || current_user.email
  end


end
