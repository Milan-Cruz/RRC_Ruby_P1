class JokesController < ApplicationController
  def index
    if params[:query].present?
      @jokes = Joke.where("joke_text LIKE ?", "%#{params[:query]}%").page(params[:page]).per(20)
    else
      @jokes = Joke.page(params[:page]).per(20)
    end
  end

  def show
    @joke = Joke.find(params[:id])
  end
end
