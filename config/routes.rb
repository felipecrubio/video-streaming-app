Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :videorooms, only: %w[new create]

  resources :videorooms, only: :show do
    resources :messages, only: :create
  end
end
