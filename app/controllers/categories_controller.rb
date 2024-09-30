class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show destroy]

  def index
    @categories = Category.all
  end

  def show
  end

  def create
    if @category.save
      redirect_to categories_path
    else
      render :new, status: unprocessable_entity
    end
  end

  def new
    @category = Category.new
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
