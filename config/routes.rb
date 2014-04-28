Ratab::Application.routes.draw do
  resources :users do
    member do
      get :password
      patch :change_password
    end

    collection do
      get :forgot_password
      put :send_password_reset_instructions

      get :password_reset
      put :new_password
    end
  end
  resources :notifications, only: [:index, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  match '/signup',    to: 'users#new',              via: 'get'
  match '/signin',    to: 'sessions#new',           via: 'get'
  match '/signout',   to: 'sessions#destroy',       via: 'delete'
  match '/index',     to: 'home#index',             via: 'get'
  root to: 'home#index'
end
