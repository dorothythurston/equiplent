Equiplent::Application.routes.draw do
  root 'homes#show'

  resource :search, only: [:show]
  resource :dashboard, only: [:show]
  resources :searches, only: [:show]
  resources :items, only: [:new, :create, :show]
  resources :users,
    controller: 'users',
    only: Clearance.configuration.user_actions
end
