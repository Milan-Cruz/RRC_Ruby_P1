class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    if params[:id] == "uncategorized"
      @category_name = "Uncategorized"
      @jokes = Joke.left_outer_joins(:categories).where(categories: { id: nil })
    else
      @category = Category.find(params[:id])
      @category_name = @category.name
      @jokes = @category.jokes
    end
  end
end
