Rails.application.routes.draw do

  root 'pages#home'

  get 'login'		=> 'sessions#new'
  post 'login'		=> 'sessions#create'
  delete 'logout'	=> 'sessions#destroy'
  
  resources :boards
  resources :users
end
