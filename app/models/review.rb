# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :cocktail
  validates :rating, inclusion: { in: 1..5 }
end
