# frozen_string_literal: true

class DosesController < ApplicationController
  def create
    @cocktail = Cocktail.friendly.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @review = Review.new
    @ingredient = Ingredient.new
    @dose.cocktail = @cocktail
    if @dose.save
      flash[:notice] = 'Dose created'
      redirect_to cocktail_path(@cocktail, anchor: 'ingredients-card')
    else
      flash.now[:alert] = 'Problem please retry'
      render 'cocktails/show'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
