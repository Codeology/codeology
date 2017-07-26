Rails.application.routes.draw do
  root 'static_pages#home'
  get '/franklin', to: "static_pages#franklin"
  get '/help', to: "static_pages#help"
  get '/edward', to: "static_pages#edward"
  get '/recruitment', to: "static_pages#recruitment"
  get '/about', to: "static_pages#about"
  get '/team', to: "static_pages#team"
  get '/signup', to: "users#new"
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users, :except => [:new]
end
