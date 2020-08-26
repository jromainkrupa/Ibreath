Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/about-us', to: 'pages#about_us'
  get '/pairing', to: 'pages#pairing'
  get '/tutorial', to: 'pages#tutorial'
  get '/prepwork', to: 'pages#prepwork'
  get '/program-launch', to: 'pages#program_launch'
  get '/prepwork-results', to: 'pages#prepwork_results'
  get '/my-program', to: 'pages#my_program'
  get '/daily_program', to: 'pages#daily_program'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :smokes, only: [:create, :destroy, :new]
  resources :programs, only: [:create, :show]
end
