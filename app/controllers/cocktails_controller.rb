class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktails = Cocktails.find(params[:id])
  end

  def new
  end

  def create
  end
end
