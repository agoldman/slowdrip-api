Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
	namespace :v1 do
	  #TODO: Can the client handle sign up / sign in directly to the API without a proxy?
	  mount_devise_token_auth_for 'User', at: 'auth'
      root :to => 'home#index'
      resources :droplets, :only => [:create, :index]
      resources :users, :only => [:show] do
        resources :droplets, :only => [:show]
        resources :friends, :only => [:index] do
          member do
            patch :remove
          end
        end
        resources :friendships, :only => [:create]
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
