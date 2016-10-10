class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @questions = @user.questions.most_recent
    @solutions = @user.solutions.most_recent
  end

end
