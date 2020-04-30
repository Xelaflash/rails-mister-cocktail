# frozen_string_literal: true

class IngredientsController < ApplicationController
  before_action :skip_authorization, only: %i[create destroy]
  def create
    @cocktail = Cocktail.friendly.find(params[:cocktail_id])
    @ingredient = Ingredient.new(ingredients_params)
    @dose = Dose.new
    @ingredient.name = params[:ingredient][:name].capitalize
    if @ingredient.save
      flash[:notice] = 'Ingredient created and saved'
      redirect_to cocktail_path(@cocktail)
    else
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
