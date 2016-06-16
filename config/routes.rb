Rails.application.routes.draw do
  get 'sessions/new'

  root 'static_pages#home'
  get 'signup' => 'users#new'
  resources :users
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :entries, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
end
