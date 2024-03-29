Rails.application.routes.draw do
  resources :employees do
    resources :verifications, only: [:index, :new, :create]
  end
  resources :employees do
    post 'educational_info', on: :member
    patch 'update_educational_info', on: :member
    post 'personal_info', on: :member
    patch 'update_personal_info', on: :member
  end
  devise_for :users
  root 'landing#index'
  get 'home', to: 'home#index'
end

