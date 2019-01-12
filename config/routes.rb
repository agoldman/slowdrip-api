Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
	  namespace :v1 do
	    #TODO: Can the client handle sign up / sign in directly to the API without a proxy?
	    mount_devise_token_auth_for 'User', at: 'auth'
      #TODO: where to route to when you are logged in?
      root :to => 'home#index'
      resources :friend_requests, :only => [:create, :index, :destroy]
      resources :friendships, :only => [:create, :index, :destroy]
      resources :droplets, :only => [:create, :index]
      resources :users, :only => [:show] do
        resources :droplets, :only => [:show]
        resources :friends, :only => [:index]
        collection do
          get 'search'
        end
      end
      match '*path', to: 'errors#error_404', via: :all
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
