Rails.application.routes.draw do
  resources :users
  resources :coffees
  root :to => "welcome#home"

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get 'signout', to: 'sessions#signout'
  post '/signout', to: 'sessions#destroy'
  get 'home', to: 'welcome#home'

end
