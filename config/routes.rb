Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index', as: 'home'

  get 'about' => 'pages#about', as: 'about'

  resources :posts do 
    resources :comments
  end

  resources :restaurants, except: [:update, :edit, :destroy] do
    resources :items
  end  

  #get 'restaurants' => 'restaurants#index', as: 'restaurants'

end
