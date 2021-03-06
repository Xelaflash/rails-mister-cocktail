# frozen_string_literal: true

class CocktailsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_cocktail, only: %i[show edit update destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
    @ingredient = Ingredient.new
    @review = Review.new
    @ingredients = Ingredient.all
    @reviews = Review.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktails_params)
    @cocktail.name = params[:cocktail][:name].capitalize
    if @cocktail.save
      flash[:notice] = 'Cocktail successfully created'
      redirect_to cocktail_path(@cocktail)
    else
      flash.now[:alert] = 'Problem when creating cocktail'
      render :new
    end
  end

  def update
    if @cocktail.update(cocktails_params)
      flash[:notice] = 'Cocktail updated'
      redirect_to cocktail_path(@cocktail)
    else
      flash.now[:alert] = 'Update did not work try again'
      render :update
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def cocktails_params
    params.require(:cocktail).permit(:name, :recipe, :photo)
  end

  def set_cocktail
    @cocktail = Cocktail.friendly.find(params[:id])
  end
end
