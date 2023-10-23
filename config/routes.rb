Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get 'select_role', to: 'registrations#select_role'
  end
  #get 'select_role', to: 'users/registrations#select_role'
  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  resources :forum_threads do
    resources :forum_posts, only: [:create]
  end
end
