class PostPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    @record.approved || (@user && (@record.user == @user || @user.has_role?(:admin)))
  end

  def edit?
    @record.user == @user # essa policy nao ta funcionando muito bem
  end

  def destroy?
    @record.user == @user || @user.has_role?(:admin)
  end
end
