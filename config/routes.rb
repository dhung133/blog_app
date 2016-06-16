Rails.application.routes.draw do
  get 'sessions/new'

  root 'static_pages#home'
  get 'signup' => 'users#new'
  resources :users do
    member do
      get :following, :followers
    end
  end
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :entries, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end
