# frozen_string_literal: true

class IngredientsController < ApplicationController
  def create
    @cocktail = Cocktail.friendly.find(params[:cocktail_id])
    @ingredient = Ingredient.new(ingredients_params)
    @dose = Dose.new
    @review = Review.new
    @ingredient.name = params[:ingredient][:name].capitalize
    if @ingredient.save
      flash[:notice] = 'Ingredient created and saved'
      redirect_to cocktail_path(@cocktail, anchor: 'new_ingredient')
    else
      flash.now[:alert] = 'Problem please retry'
      render 'cocktails/show'
    end
  end

  def destroy
    @cocktail = Cocktail.friendly.find(params[:cocktail_id])
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def ingredients_params
    params.require(:ingredient).permit(:name, :tag_list)
  end
end
