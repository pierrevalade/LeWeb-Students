class UsersController < ApplicationController

  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:edit, :update]
  
  def index
    @users = User.all
  end

  def show
    @user = User.find_by_nickname(params[:id])
    redirect_to root_url unless @user
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      
      if params[:twitter] && !@user.twitter_status
        # post status to twitter
        status = "I've just registered on http://lewebstudents.com. Start networking for #leweb ! #lewebstudents"
        response = @user.access_token.post('/statuses/update.json', { :status => status })
        @user.update_attribute(:twitter_status, true)
      end
      
      redirect_to user_url(current_user)
    else
      render :action => :edit
    end
  end
end