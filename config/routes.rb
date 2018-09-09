Rails.application.routes.draw do
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/calendar', to: 'static_pages#calendar'
  get '/projects', to: 'static_pages#projects'
  get '/apply', to: 'static_pages#apply'

  get '/signup', to: 'users#new'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/dashboard', to: 'webapp#test'

  resources :users
=begin
  , :except => [:new] do
    member do
      get :confirm_email
    end
  end
=end

  resources :user_email_confirmations, :only => [:new, :create]
  end
  # D3 graph data paths
  # get '/leadership_team', to: 'd3_graphs#leadership_team'
