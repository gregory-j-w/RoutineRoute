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
  get  '/bussave', to: 'buses#bussave'
  post  '/bussave', to: 'buses#create'
  delete '/buses/:id', to: 'buses#destroy'
  get  '/ltrainroute', to: 'ltrains#ltrainroute'
  get  '/ltraindestination', to: 'ltrains#ltraindestination'
  get  '/ltrainstation', to: 'ltrains#ltrainstation'
  get  '/ltrainsave', to: 'ltrains#ltrainsave'
  post  '/ltrainsave', to: 'ltrains#create'
  delete '/ltrains/:id', to: 'ltrains#destroy'

  resources :users
  resources :buses,          only: [:create, :destroy]
  resources :ltrains,        only: [:create, :destroy]
end
