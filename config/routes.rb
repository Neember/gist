Rails.application.routes.draw do
  
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :snippets, only: [:new, :create, :edit, :update, :show, :index, :destroy]
  root 'snippets#index'

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks', sessions: "sessions" }
end
