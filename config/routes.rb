Rails.application.routes.draw do

  root 'pages#home'

  resources :users do
    resources :profile 
  end

  resources :profiles do 
    resources :photos
  end

  resources :photos do 
    resources :pats
  end

  resources :albums
  resources :categories

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
end
