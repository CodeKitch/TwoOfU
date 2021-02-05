Rails.application.routes.draw do
  root 'sessions#home'

  get '/auth/google_oauth2/callback' => 'sessions#omniauth'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'


  resources :tricks do
    resources :tips
  end

  resources :tips

  resources :users do
    resources :tricks
  end

  resources :categories, only: [:index, :show]



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
