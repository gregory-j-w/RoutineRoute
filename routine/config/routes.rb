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
  get  '/busroute', to: 'static_pages#busroute'
  get  '/busdirection', to: 'static_pages#busdirection'
  get  '/busstop', to: 'static_pages#busstop'

  resources :users
  resources :buses,          only: [:create, :destroy]
end
