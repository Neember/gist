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

    resources :snippet_files, only: [:new], controller: "snippets/snippet_files"
  end

  get 'github_apis/gists' => 'github_apis#gists', :as => 'github_apis_gists'

  devise_scope :user do
    devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks', sessions: "sessions" }
  end
end
