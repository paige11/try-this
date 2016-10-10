class QuestionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def new
    @question = Question.new
    @question.categories.build
    @categories = Category.all
  end

  def create
    @question = Question.create(question_params)
    redirect_to question_path(@question)
  end

  def edit
    @question = Question.find(params[:id])
    @question.categories.build
    @categories = Category.all
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    redirect_to question_path(@question)
  end

  def show
    @question = Question.find(params[:id])
    @solutions = @question.solutions
    @vote = Vote.new
  end

  def destroy
    @question = Question.find(params[:id])
    # delete all solutions and votes associated with this question?
    @question.delete
    redirect_to root_path
  end

  private

  def question_params
    params.require(:question).permit(:user_id, :content, category_ids:[], category_attributes: [:name])
  end

end
