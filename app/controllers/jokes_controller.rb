class JokesController < ApplicationController
  def index
    if params[:query].present? && params[:category_id].present?
      # Filter by both search query and category
      @jokes = Joke.joins(:categories)
                   .where("joke_text LIKE ?", "%#{params[:query]}%")
                   .where(categories: { id: params[:category_id] })
                   .page(params[:page]).per(26)
    elsif params[:query].present?
      # Filter by search query only
      @jokes = Joke.where("joke_text LIKE ?", "%#{params[:query]}%")
                   .page(params[:page]).per(26)
    elsif params[:category_id].present?
      # Filter by category only
      @jokes = Joke.joins(:categories)
                   .where(categories: { id: params[:category_id] })
                   .page(params[:page]).per(26)
    else
      # No filters applied, show all jokes
      @jokes = Joke.page(params[:page]).per(26)
    end
  end

  def show
    @joke = Joke.find(params[:id])
  end
end
