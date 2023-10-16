Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  resources :forum_threads, only: [:new, :create, :index, :show] do
    resources :comments, only: [:create]
    resources :forum_posts, only: [:create]
  end
end
