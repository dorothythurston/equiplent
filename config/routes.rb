Equiplent::Application.routes.draw do
  root 'homes#show'

  resource :dashboard, only: [:show]
end
