Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
	namespace :v1 do
	  #TODO: Can the client handle sign up / sign in directly to the API without a proxy?
	  mount_devise_token_auth_for 'User', at: 'auth'
      root :to => 'home#index'
      resources :users, :only => [:show] do
        resources :droplets, :only => [:create, :show, :index]
        resources :friends, :only => [:index]
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
