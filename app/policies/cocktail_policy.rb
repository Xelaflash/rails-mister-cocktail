# frozen_string_literal: true

class CocktailPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def create?
      true
    end
  end
end
