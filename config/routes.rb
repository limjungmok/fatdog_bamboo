Rails.application.routes.draw do

  root 'pages#home'

  get 'login'		=> 'sessions#new'
  post 'login'		=> 'sessions#create'
  delete 'logout'	=> 'sessions#destroy'
  patch 'edit_like' => 'boards#edit_like'
  resources :boards
  resources :users
  resources :replies
end
