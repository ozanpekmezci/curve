class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      @followed_user_posts = []
      @followed_tag_posts = []
      user.following.each do |f|
        @followed_user_posts += f.posts
      end
      @followed_user_posts += user.posts
      scope.all.each do |p|
        if (p.all_labels_list & user.follow_tags).any?
          @followed_tag_posts.push(p)
        end
      end
      @posts = @followed_tag_posts | @followed_user_posts
    end
  end
  def destroy?
    user.admin? || record.user == user #ya admin ya da kendi postu
  end
  def edit?
    user.admin? || record.user == user #ya admin ya da kendi postu
  end
end
