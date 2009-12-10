ActionController::Routing::Routes.draw do |map|
  
  map.resources :users, :collection => {:replies => :get}
  map.resource :user_session, :member => {:twitter => :get}
  
  map.resources :tags
  
  map.login '/login', :controller => 'user_sessions', :action => :create

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"
end
