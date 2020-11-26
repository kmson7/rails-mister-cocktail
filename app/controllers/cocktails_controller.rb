class CocktailsController < ApplicationController
  def create
  end

  def index
    @cocktails = Cocktail.all
  end

  def new
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end
end
