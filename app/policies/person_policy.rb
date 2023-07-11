class PersonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def create?
    user.has_role? :global_admin
  end
  def new?
    user.has_role? :global_admin
  end
  def edit
    user.has_role? :global_admin
  end
  def update?
    user.has_role? :global_admin
  end
  def destroy?
    user.has_role? :global_admin
  end
end
