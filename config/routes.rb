Rails.application.routes.draw do
  resources :projects
  devise_for :user
  resources :user

  root to: "home#index"
end
