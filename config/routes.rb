Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/pairing', to: 'pages#pairing'
  get '/tutorial', to: 'pages#tutorial'
  get '/prepwork', to: 'pages#prepwork'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :smokes, only: [:create, :destroy]
  resources :programs, only: [:create, :show]
end
