Rails.application.routes.draw do
  get 'shoes/index' => 'shoes#index'
  get 'shoes/index/result' => 'shoes#result'
end
