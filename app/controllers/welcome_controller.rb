class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @user_greeting = user_or_guest_greeting
    @question = Question.new
    @question.categories.build
    @categories = Category.all
    @category = Category.new
  end

end
