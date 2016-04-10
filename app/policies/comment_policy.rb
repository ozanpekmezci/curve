class CommentPolicy < ApplicationPolicy
  def destroy?
    user.admin? || record.user == user #ya admin ya da kendi postu
  end
  def edit?
    user.admin? || record.user == user #ya admin ya da kendi postu
  end
  def buy?
    user.admin? || record.user != user
  end
end
