class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    if params[:id] == "uncategorized"
      @category_name = "Uncategorized"
      @jokes = Joke.left_outer_joins(:categories).where(categories: { id: nil }).page(params[:page]).per(26) # Pagination applied to uncategorized jokes
    else
      @category = Category.find(params[:id])
      @category_name = @category.name
      @jokes = @category.jokes.page(params[:page]).per(26) # Pagination applied to jokes within the selected category
    end
  end
end
