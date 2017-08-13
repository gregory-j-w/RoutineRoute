Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/about',   to: 'static_pages#about'
  get  '/addroute', to: 'static_pages#addroute'
  get  '/signup',  to: 'users#new'

  resources :users
end
