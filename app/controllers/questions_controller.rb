class QuestionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def new
    @question = Question.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

end
