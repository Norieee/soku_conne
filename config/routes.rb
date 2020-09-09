Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: 'messages#index'
  resources :projects, only: [:new, :create]
  resources :qas do
    collection { post :import }
    collection { get :export }
    collection { get :search }
  resources :projects, only: [:new, :create] do
    resources :messages, only: [:show, :create]
  end
end