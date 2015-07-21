Rails.application.routes.draw do

  root 'pages#home'
  
  resources :boards
end
