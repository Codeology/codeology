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

  get '/dashboard', to: 'webapp#dashboard'

  get '/myAvailability', to: 'availabilities#showUserAvailability'
  get '/prune', to: 'availabilities#prune'

  resources :users
  resources :account_activations, :only => [:new, :create, :edit]
  resources :password_resets, :only => [:new, :create, :edit, :update]
  resources :availabilities, :only => [:index, :new, :create, :update, :destroy]
  resources :upcoming_interviews, :only => [:index, :destroy]
  resources :past_interviews, :only => [:index, :edit, :update]
end


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


GET	      /password_resets/new	                          new	          new_password_reset_path
POST	    /password_resets	                              create	      password_resets_path
GET	      http://ex.co/password_resets/<token>/edit	      edit	        edit_password_reset_url(token)
PATCH	    /password_resets/<token>                      	update      	password_reset_path(token)

=end


  # D3 graph data paths
  # get '/leadership_team', to: 'd3_graphs#leadership_team'
