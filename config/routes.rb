Rails.application.routes.draw do
  resources :jobs
  resources :coding_languages
  resources :degrees
  resources :projects
  devise_for :user
  resources :user

  resources :likes, only: %i[create destroy]

  root to: "home#index"
end
