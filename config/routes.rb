Rails.application.routes.draw do
  root 'snippets#index'
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :snippets do
    member do 
      get :share, to: :share_form
      post :share
    end

    collection do 
      get :search
      get :my_gists
    end
  end

  devise_for :users, skip: [:sessions], controllers: {omniauth_callbacks: 'omniauth_callbacks'}

  as :user do
    delete 'signout' => 'devise/sessions#destroy', as: :destroy_user_session
  end
end
