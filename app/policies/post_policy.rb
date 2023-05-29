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
      @record.user == @user
    end

    def destroy?
      @record.user == @user || @user.has_role?(:admin)
    end
  end
end
