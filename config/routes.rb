Equiplent::Application.routes.draw do
  root 'homes#show'

  resource :search, only: [:show]
  resource :dashboard, only: [:show]
  resources :users, only: [:show, :edit, :update]
  resources :searches, only: [:show]
  resources :items, only: [:new, :create, :show, :update, :edit, :destroy]
  resources :reservations, only: [:show, :destroy, :update, :create, :new, :edit]

  resources :users,
    controller: 'users',
    only: Clearance.configuration.user_actions
end
