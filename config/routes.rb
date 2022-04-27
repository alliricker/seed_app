Rails.application.routes.draw do
  get 'home', to: 'welcome#home'
  resources :users
  resources :coffees

end
