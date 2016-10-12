class SolutionsController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @solution = @question.solutions.build
  end

  def create
    @solution = Solution.new(solution_params)
    if @solution.save
      redirect_to question_path(@solution.question)
    else
      @question = Question.find(solution_params[:question_id])
      render 'new'
    end
  end

  def edit
    @solution = Solution.find(params[:id])
    @question = Question.find(params[:question_id])
    if @solution.contributor != current_user
      flash[:alert] = "You do not have access to this page."
      redirect_to root_path
    end
  end

  def update
    @solution = Solution.find(params[:id])
    if @solution.update(solution_params)
      redirect_to question_path(@solution.question)
    else
      @question = Question.find(solution_params[:question_id])
      render 'edit'
    end
  end

  def destroy
    @solution = Solution.find(params[:id])
    @solution.destroy
    redirect_to question_path(@solution.question)
  end

  private

  def solution_params
    params.require(:solution).permit(:content, :question_id, :contributor_id)
  end

end
