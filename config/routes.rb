Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'

  resources :users, only: %i(show)
  resources :follows, only: %i(create)
  resource :follows, only: %i(destroy)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
