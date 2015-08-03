Rails.application.routes.draw do

  #root 'pages#show'
  root 'boards#index'

  get 'login'		=> 'sessions#new'
  post 'login'		=> 'sessions#create'
  delete 'logout'	=> 'sessions#destroy'
  patch 'like' => 'boards#like'
  patch 'unlike' => 'boards#unlike'
  resources :boards do
  	resources :replies
    get :autocomplete_board_b_category, :on => :collection
  end
  resources :users
  
end
