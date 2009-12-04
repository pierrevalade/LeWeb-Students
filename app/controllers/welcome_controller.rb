class WelcomeController < ApplicationController
  
  def index
    @users = User.all(:order => 'created_at DESC', :limit => 11)
    @tags = Tag.all(:order => 'users_count DESC', :limit => 20).sort { |a, b| a.name <=> b.name }
  end
  
end
