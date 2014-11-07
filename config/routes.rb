Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :snippets, only: [:new, :create, :edit, :update, :show]
  root 'snippets#new'
end
