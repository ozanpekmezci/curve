class PostPolicy < ApplicationPolicy
  def destroy?
    user.admin? || record.user == user #ya admin ya da kendi postu
  end
  def edit?
    user.admin? || record.user == user #ya admin ya da kendi postu
  end
end