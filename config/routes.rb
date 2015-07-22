Rails.application.routes.draw do

  root 'pages#home'

  get 'write' =>  'pages#write'
  get 'board' =>  'pages#board'
  
end
