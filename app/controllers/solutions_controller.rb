class SolutionsController < ApplicationController

  def new
    @solution = Solution.new
    @question = Question.find(params[:question_id])
  end

  def create
    @solution = Solution.new(solution_params)
    if @solution.save
      redirect_to question_path(@solution.question)
    else
      render 'new'
    end
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
    @solution.destroy
    redirect_to question_path(@solution.question)
  end

  private

  def solution_params
    params.require(:solution).permit(:content, :question_id, :contributor_id)
  end

end
