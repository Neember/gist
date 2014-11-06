Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :my_gists, only: [:new]
  root 'my_gists#new'
end
