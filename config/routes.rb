Rails.application.routes.draw do

  #  mount API::Base, at: "/"
  mount DID::Base => '/'
  mount GrapeSwaggerRails::Engine, at: "/docs"
  #mount GrapeSwaggerRails::Engine, at: "/documentation"
  root 'static_pages#home'

  #get 'static_pages/home'
  #get '/static_pages/help'

  get '/help',    to: 'static_pages#help' #, as: 'helf'
  get '/about',   to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup',  to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login',   to: 'sessions#new'
  post '/login',  to: 'sessions#create'
  delete'/logout',to: 'sessions#destroy'
<<<<<<< HEAD
  resources :users do
    member do
      get :following, :followers
    end
  end
=======
>>>>>>> account-activation

  resources :users
  resources :account_activations, only: [:edit]

<<<<<<< HEAD
  resources :microposts,         only: [:create, :destroy]
  resources :relationships,      only: [:create, :destroy]
=======
  resources :microposts,          only: [:create, :destroy]

>>>>>>> account-activation


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'application#hello'
end
