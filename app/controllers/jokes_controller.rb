class JokesController < ApplicationController
  def index
    if params[:query].present?
      @jokes = Joke.where("joke_text LIKE ?", "%#{params[:query]}%")
    else
      @jokes = Joke.all
    end
  end

  def show
  end
end
