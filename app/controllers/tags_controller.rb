class TagsController < ApplicationController
  before_action :authenticate_user!, only: [ :show ]

  def show
    if params[:id]
      @current_tag_id = params[:id]
      @posts = Post.tagged_with(params[:id])
    end
  end
  def follow
    if params[:id]
      @posts = Post.tagged_with(params[:id])
      @current_tag_id = params[:id]
      current_user.follow_tags.push(@current_tag_id)
      respond_to do |format|
      if current_user.save!
        format.html
        format.js
      end
      #current_user.update_attributes(follow_tags: ([@current_tag_id].concat(current_user.follow_tags)))
        flash[:success] = 'Followed tag'
      #  redirect_to tag_path(@current_tag_id)
      end
    end
  end
  def unfollow
    if params[:id]
      @posts = Post.tagged_with(params[:id])
      @current_tag_id = params[:id]
      current_user.follow_tags.delete(@current_tag_id)
      respond_to do |format|
      if current_user.save!
        format.html
        format.js
      end
        flash[:error] = 'UNFollowed tag'
      #  redirect_to tag_path(@current_tag_id)
      end
    end
  end
end
