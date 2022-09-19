Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users, path: 'users', controllers: { confirmations: "users/confirmations",
                                                   passwords: "users/passwords",
                                                   registrations: "users/registrations",
                                                   sessions: "users/sessions",
                                                   unlocks: "users/unlocks" }

  resources :videorooms, only: %w[new create]

  resources :videorooms, only: :show do
    resources :messages, only: :create
  end
end
