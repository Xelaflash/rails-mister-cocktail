# frozen_string_literal: true

class Api::V1::CocktailsController < Api::V1::BaseController
  before_action :set_cocktail, only: %i[show]
  def index
    @cocktails = Cocktail.all
  end

  def show; end

  private

  def set_cocktail
    @cocktail = Cocktail.friendly.find(params[:id])
  end
end
