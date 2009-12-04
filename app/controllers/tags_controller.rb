class TagsController < ApplicationController
  
  def index
    @tags = Tag.all(:order => 'users_count DESC')
  end
  
  def show
    @tag = Tag.find(params[:id])
    @users = User.find_by_tag_id(@tag.id)
  end
  
end
