class PostPolicy < ApplicationPolicy
  def destroy?
    user.admin?
  end
end
