Rails.application.routes.draw do
  get '/pages/emergency_form', to: 'pages#emergency_form'
  get '/pages/loading_page', to: 'pages#loading_page'
  devise_for :users, controllers: { registrations: "registrations" }
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # config/routes.rb
  devise_scope :user do
    get 'select_role', to: 'users/registrations#select_role'
  end
  get '/users/registrations/user', to: 'users/registrations#user'
  get '/users/registrations/volunteer', to: 'users/registrations#volunteer'
  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  resources :forum_threads do
    resources :forum_posts, only: [:create]
  end
end
