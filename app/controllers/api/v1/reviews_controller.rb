# frozen_string_literal: true

class Api::V1::ReviewsController < Api::V1::BaseController
  def create
    @cocktail = Cocktail.friendly.find(params[:cocktail_id])
    @review = Review.new(review_params)
    @review.cocktail = @cocktail
    if @review.save
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating)
  end

  def render_error
    render json: { errors: @cocktail.errors.full_messages },
           status: :unprocessable_entity
  end
end
