# frozen_string_literal: true

class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  validates :name, uniqueness: true, presence: true
  validates :recipe, presence: true

  has_many_attached :photos
end
