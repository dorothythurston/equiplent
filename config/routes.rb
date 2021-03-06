Equiplent::Application.routes.draw do
  root 'homes#show'

  resource :search, only: [:show]
  resource :dashboard, only: [:show]
  resources :users, only: [:index, :show, :edit, :update]
  resources :pairs, only: [:new, :create, :destroy]
  resources :searches, only: [:show]
  resources :items, only: [:index, :new, :create, :show, :update, :edit, :destroy]
  resources :reservations, only: [:index,:show, :destroy, :update, :create, :new, :edit]

  resources :users,
    controller: 'users',
    only: Clearance.configuration.user_actions
end
