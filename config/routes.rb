Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :destroy] do
    resources :smokes, only: [:new, :create]
    resources :programs, only: [:create, :show]
  end
  resources :smokes, only: [:destroy]
end
