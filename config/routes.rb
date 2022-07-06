Rails.application.routes.draw do
  resources :users
  resources :reviews
  resources :coffees
  resources :categories
  root :to => "welcome#home"

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get 'signout', to: 'sessions#signout'
  post '/signout', to: 'sessions#destroy'
  get 'home', to: 'welcome#home'
  get '/auth/:provider/callback', to: 'sessions#google'

  resources :coffees do 
    resources :categories
  end

end
