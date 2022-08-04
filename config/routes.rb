Rails.application.routes.draw do
  devise_for :users
  mount Ckeditor::Engine => '/ckeditor'
  root to: "static_pages#home"
	get "/contact", to:"static_pages#contact"
	get "/about", to:"static_pages#about"
  resources :tales do
    resources :reviewtales
    collection do
      get "show_archived", to: "tales#show_archived"
      get "newest", to: "tales#newest"
      get "many_follow", to: "tales#many_follow"
      get "many_favourite", to: "tales#many_favourite"
    end
    member do
      put "update_status", to: "tales#update_status"
      get "preview", to: "tales#preview"
      get :followers
      get :favouriters
    end
  end
  resources :users do
    collection do
      get :following
      get :favouriting
    end
    member do
      get "show_archived_user", to: "users#show_archived_user"
    end
  end
  resources :requests do
    collection do
      get "show_seen", to: "requests#show_seen"
      get "show_not_seen", to: "show_not_seen"
    end
    member do
      put "update_status", to: "requests#update_status"
    end
  end
  resources :categories
  resources :authors
  resources :relationships, only: [:create, :destroy]
  resources :favourites, only: [:create, :destroy]
end
