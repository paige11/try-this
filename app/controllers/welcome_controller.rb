class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @user_greeting = user_or_guest_greeting
    @questions = Question.ten_most_recent
    @categories = Category.alphabetize
  end
  
end
