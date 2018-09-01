Rails.application.routes.draw do
  # post 'shoes/index' => 'shoes#result'
  # get 'shoes/index' => 'shoes#index'
  
  resources :shoes 
  
  root to: 'shoes#index'
end
