class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @category = Category.find(params[:id])
    @questions = @category.questions.most_recent
  end

end
