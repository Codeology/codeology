Rails.application.routes.draw do

  get 'sessions/new'

  root 'static_pages#home'

  get 'help', :to => "static_pages#help"
  get 'about', :to => "static_pages#about"
  get 'team', :to => "static_pages#team"

  resources :users
end
