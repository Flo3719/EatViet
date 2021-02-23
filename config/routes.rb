Rails.application.routes.draw do
  devise_for :users

  authenticated do
    root :to => 'restaurants#index', as: :authenticated
  end

  root to: 'pages#landing', as: 'home'
  
  get 'about' => 'pages#about', as: 'about'
  get 'landing' => 'pages#landing', as: 'landing'

  resources :posts do 
    resources :comments
  end

  resources :subscriptions

  resources :restaurants, except: [:update, :edit, :destroy] do
    resources :items do 
      resources :translations
    end
  end  

  #get 'restaurants' => 'restaurants#index', as: 'restaurants'

end
