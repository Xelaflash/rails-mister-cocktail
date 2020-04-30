# frozen_string_literal: true

class CocktailPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, post)
    @user = user
    @post = post
  end

  def show?
    true # Anyone can view a restaurant
  end

  def create?
    true
  end

  def update?
    record.user == user  # Only restaurant creator can update it
  end

  def destroy?
    record.user == user  # Only restaurant creator can update it
  end
end
