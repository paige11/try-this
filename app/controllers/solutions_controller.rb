class SolutionsController < ApplicationController

  def new
    @solution = Solution.new
    @question = Question.find(params[:question_id])
  end

  def create
    @solution = Solution.create(solution_params)
    redirect_to question_path(@solution.question)
  end

  def edit
    @solution = Solution.find(params[:id])
  end

  def update
    @solution = Solution.find(params[:id])
    @solution.update(solution_params)
    redirect_to question_path(@solution.question)
  end

  def destroy
    @solution = Solution.find(params[:id])
    @solution.delete
  end

  def solution_params
    params.require(:solution).permit(:content, :question_id, :contributor_id)
  end

end
