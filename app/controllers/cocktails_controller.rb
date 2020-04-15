# frozen_string_literal: true

class CocktailsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktails_params)
    @cocktail.name = params[:cocktail][:name].capitalize
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def cocktails_params
    params.require(:cocktail).permit(:name, :recipe, :picture)
  end
end
