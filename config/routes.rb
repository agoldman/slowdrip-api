Rails.application.routes.draw do

  unauthenticated do
    root :to => 'home#index'
  end
  devise_for :users
  authenticated do
    root :to => 'users#profile'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
