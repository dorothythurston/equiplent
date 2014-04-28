Equiplent::Application.routes.draw do
  root 'homes#show'

  resource :dashboard, only: [:show]
  resources :users,
    controller: 'users',
    only: Clearance.configuration.user_actions
end
