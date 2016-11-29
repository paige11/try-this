class QuestionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def new
    @question = Question.new
    @question.categories.build
    @categories = Category.all
    @category = Category.new
  end

  def most_recent
    @recent = Question.ten_most_recent
    render json: @recent
  end

  def most_popular
    @popular = Question.order_by_votes
    render json: @popular
  end

  def create
    @question = Question.create(question_params)
    render json: @question
  end

  def edit
    @question = Question.find(params[:id])
    @question.categories.build
    @categories = Category.all
    @category = Category.new
    if @question.user != current_user
      flash[:alert] = "You do not have access to this page."
      redirect_to root_path
    end
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to question_path(@question)
    else
      render 'edit'
    end
  end

  def show
    @question = Question.find(params[:id])
    @solutions = @question.solutions
    @vote = Vote.new
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path
  end

  private

  def question_params
    params.require(:question).permit(:user_id, :content, category_ids:[], categories_attributes: [:name])
  end

end
