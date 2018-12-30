Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
	namespace :v1 do

	  unauthenticated do
		root :to => 'home#index'
      end
      devise_for :users
      authenticated do
		root :to => 'users#profile'
      end
	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
