# frozen_string_literal: true

class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :reviews, dependent: :destroy

  validates :name, uniqueness: true, presence: true
  validates :recipe, presence: true

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_one_attached :photo

  def fix_string
    self.recipe = recipe.gsub(/\r\n/, '').split('.').each(&:strip!)
  end

  def average_rating
    reviews.average(:rating)
  end
end
