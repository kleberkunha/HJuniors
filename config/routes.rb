Rails.application.routes.draw do
  resources :degrees
  resources :projects
  devise_for :user
  resources :user

  root to: "home#index"
end
