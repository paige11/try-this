class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @category = Category.find(params[:id])
    @questions = @category.questions.most_recent
  end

  def category_data
    @category = Category.find(params[:id])
    render json: @category
  end

end
