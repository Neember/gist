Rails.application.routes.draw do
  root 'snippets#index'
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :snippets do
    get :search, on: :collection
    get :share, to: :share_form, on: :member
    get :my_gists, on: :collection
    post :share, on: :member
  end

  devise_scope :user do
    devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks', sessions: "sessions" }
  end
end
