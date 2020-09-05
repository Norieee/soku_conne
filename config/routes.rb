Rails.application.routes.draw do
  devise_for :users
  root to: 'messages#index'
  resources :projects, only: [:new, :create]
  resources :qas do
    collection { post :import }
  end
end