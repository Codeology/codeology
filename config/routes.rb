Rails.application.routes.draw do
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/calendar', to: 'static_pages#calendar'
  get '/projects', to: 'static_pages#projects'
  get '/apply', to: 'static_pages#apply'

  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'

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

GET     	/users	        index	    users_path          	page to list all users
GET     	/users/1	      show	    user_path(user)	      page to show user
GET	      /users/new	    new	      new_user_path	        page to make a new user (signup)
POST   	  /users	        create	  users_path	          create a new user
GET	      /users/1/edit	  edit	    edit_user_path(user)	page to edit user with id 1
PATCH	    /users/1	      update	  user_path(user)	      update user
DELETE	  /users/1	      destroy	  user_path(user)	      delete user

=end

  resources :user_email_confirmations, :only => [:new, :create]
  end
  # D3 graph data paths
  # get '/leadership_team', to: 'd3_graphs#leadership_team'
