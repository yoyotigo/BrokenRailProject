Rails.application.routes.draw do
  resources :discussions

  root to: 'discussions#index'
  
end
