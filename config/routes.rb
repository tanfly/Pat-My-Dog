Rails.application.routes.draw do

  root 'pages#home'

  resources :users do
    resources :profiles 
  end

  resources :profiles do 
    resources :photos
  end

  resources :photos, only: [:show, :index, :destroy] do 
    resources :pats
  end

  resources :profiles do
    resources :albums
  end

  resources :albums, only: [:show, :index] do 
    resources :photos
  end

  resources :comments
  resources :categories

  get '/auth/facebook/callback' => 'sessions#create'

  get '/privacy' => 'privacy#show'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
end
