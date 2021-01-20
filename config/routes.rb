Rails.application.routes.draw do
  root 'pages#home'
  resources :users, only:[:index]

  devise_for :users, path: 'auth', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    password: 'secret',
    confirmation: 'verification',
    unlock: 'unblock',
    registration: 'register',
    sign_up: 'cmon_let_me_in',
  }

  devise_scope :user do
    delete 'auth/logout', to: 'devise/sessions#destroy'
  end

  resources :posts
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
end
