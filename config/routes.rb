Rails.application.routes.draw do
  get '/login',to: 'sessions#new'
  get '/signup', to: 'users#new'
  root to: "static_pages#home"
	get "/contact", to:"static_pages#contact"
	get "/about", to:"static_pages#about"
  post "login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :tales do
    member do
      get 'preview', to: 'tales#preview'
      get :followers
    end
  end
  resources :users do
    collection do
      get :following
    end
  end
  resources :categories
  resources :relationships, only: [:create, :destroy]
end
