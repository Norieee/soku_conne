Rails.application.routes.draw do
  devise_for :users
  root to: 'messages#index'
  resources :projects, only: [:new, :create]
end