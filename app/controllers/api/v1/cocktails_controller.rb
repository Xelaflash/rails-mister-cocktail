# frozen_string_literal: true

class Api::V1::CocktailsController < Api::V1::BaseController
  before_action :set_cocktail, only: %i[show]
  def index
    @cocktails = policy_scope(Cocktail)
  end

  def show
  end

  private

  def set_cocktail
    @cocktail = Cocktail.friendly.find(params[:id])
    authorize @cocktail
  end
end
