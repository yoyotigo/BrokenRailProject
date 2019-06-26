Rails.application.routes.draw do
  get 'users/new'
  root 'posts#index', as: 'home' #this is the root index where local host first loads
  get 'about' => 'pages#about', as: 'about'
  resources :posts do 
  	resources :comments
  end
end
 