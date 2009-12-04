class UserSessionsController < ApplicationController
  
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  
  def create
    request_token = UserSession.oauth_consumer.get_request_token(:oauth_callback => twitter_user_session_url)
    session[:request_token] = request_token.token
    session[:request_token_secret] = request_token.secret
    
    redirect_to request_token.authorize_url
  end
  
  def twitter
    # exchange oauth token
    begin
      request_token = OAuth::RequestToken.new(UserSession.oauth_consumer, session[:request_token], session[:request_token_secret])
      access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
    rescue OAuth::Unauthorized
      return redirect_to root_url
    end
    
    user = User.find_or_initialize_by_oauth_token(access_token.token)
    if user.new_record?
      user.oauth_secret = access_token.secret
      user.save!
      redirect_to edit_user_url(user.id)
    else
      redirect_to root_url
    end
    
    user_session = UserSession.new(user)
    user_session.save
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_to root_url
  end
  
end