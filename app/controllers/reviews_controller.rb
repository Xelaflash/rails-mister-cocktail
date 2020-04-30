# frozen_string_literal: true

class ReviewsController < ApplicationController
  def new
    @cocktail = Cocktail.friendly.find(params[:cocktail_id])
    @review = Review.new
  end

  def create
    @cocktail = Cocktail.friendly.find(params[:cocktail_id])
    @review = current_user.reviews.new(review_params)
    @review.cocktail = @cocktail
    @dose = Dose.new
    @ingredient = Ingredient.new
    if @review.save
      flash[:success] = 'Review successfully created'
      redirect_to cocktail_path(@cocktail)
    else
      flash[:alert] = 'Something went wrong'
      render 'cocktails/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to cocktail_path(@review.cocktail)
  end

  private

  def review_params
    params.require(:review).permit(:rating)
  end
end
