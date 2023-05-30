class PostPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end

    def show?
      @record.approved || @user.has_role?(:admin)
    end

    def edit?
      @record.user_is == @user.id # essa policy nao ta funcionando muito bem
    end

    def destroy?
      @record.user_id == @user.id || @user.has_role?(:admin)
    end
  end
end
