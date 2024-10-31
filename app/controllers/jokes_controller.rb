class JokesController < ApplicationController
  def index
    if params[:query].present?
      @jokes = Joke.where("joke_text LIKE ?", "%#{params[:query]}%").page(params[:page]).per(26)
    else
      @jokes = Joke.page(params[:page]).per(26)
    end
  end

  def show
    @joke = Joke.find(params[:id])
  end
end
