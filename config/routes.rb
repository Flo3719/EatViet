Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#landing', as: 'home'

  get 'about' => 'pages#about', as: 'about'
  get 'landing' => 'pages#landing', as: 'landing'

  resources :posts do 
    resources :comments
  end

  resources :restaurants, except: [:update, :edit, :destroy] do
    resources :items do 
      resources :translations
    end
  end  

  #get 'restaurants' => 'restaurants#index', as: 'restaurants'

end
