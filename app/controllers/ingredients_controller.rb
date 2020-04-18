# frozen_string_literal: true

class IngredientsController < ApplicationController
  def create
    @ingredient = Ingredient.new(ingredients_params)
    @ingredient.name = params[:ingredient][:name].capitalize
    @cocktail = Cocktail.find(params[:cocktail_id])
    if @ingredient.save
      flash[:notice] = 'Ingredient created and saved'
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def ingredients_params
    params.require(:ingredient).permit(:name)
  end
end
