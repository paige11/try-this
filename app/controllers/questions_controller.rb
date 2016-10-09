class QuestionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    @question.save
    redirect_to question_path(@question)
  end

  def edit
  end

  def update
  end

  def show
    @question = Question.find(params[:id])
  end

  def destroy
  end

  def question_params
    params.require(:question).permit(:content, category_ids:[])
  end

end
