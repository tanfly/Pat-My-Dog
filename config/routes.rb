Rails.application.routes.draw do

  root 'pages#home'

  resources :users do
    resources :photos 
    post '/photos/:id' => 'photos#show'
  end

  resources :photos
  resources :albums
  resources :categories

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
end
