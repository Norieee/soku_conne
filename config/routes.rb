Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: 'projects#index'
  resources :projects, only: [:new, :create] do
    resources :messages, only: [:index, :create]
  end
  
  resources :qas do
    collection { post :import }
    collection { get :export }
    collection { get :search }
  end
end