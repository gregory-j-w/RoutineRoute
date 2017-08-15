Rails.application.routes.draw do
  get 'sessions/new'

  root 'static_pages#home'
  get  '/about',   to: 'static_pages#about'
  get  '/addroute', to: 'static_pages#addroute'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get  '/busroute', to: 'buses#busroute'
  get  '/busdirection', to: 'buses#busdirection'
  get  '/busstop', to: 'buses#busstop'

  resources :users
  resources :buses,          only: [:create, :destroy]
end
