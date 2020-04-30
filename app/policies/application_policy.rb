# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(_user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def destroy_all?
    true
  end

  class Scope
    attr_reader :user, :scope

    def initialize(_user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end