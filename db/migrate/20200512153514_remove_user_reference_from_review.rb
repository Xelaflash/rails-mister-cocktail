# frozen_string_literal: true

class RemoveUserReferenceFromReview < ActiveRecord::Migration[5.2]
  def change
    remove_reference :reviews, :user, index: true
  end
end
