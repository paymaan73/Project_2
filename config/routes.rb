Rails.application.routes.draw do
  root 'pages#home'
  resources :users, only:[:index]
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  devise_for :users
  resources :posts
end
