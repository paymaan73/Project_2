Rails.application.routes.draw do
  root 'pages#home'
  resources :users, only: %i[index]
  delete 'users/:id', to: 'users#destroy', as: :admin_destroy_user


  devise_for :users, path: 'auth',
    controllers:{
      confirmations: 'confirmations'
},
    path_names: {
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
end
