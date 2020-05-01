# frozen_string_literal: true

class Api::V1::CocktailsController < Api::V1::BaseController
  before_action :set_cocktail, only: %i[show photo]
  def index
    @cocktails = Cocktail.all
  end

  def show; end

  def photo
    if @cocktail.photo.attached?
      redirect_to rails_blob_url(@cocktail.photo)
    else
      head :not_found
    end
  end

  private

  def set_cocktail
    @cocktail = Cocktail.friendly.find(params[:id])
  end
end
