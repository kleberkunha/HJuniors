Rails.application.routes.draw do
  resources :coding_languages
  resources :degrees
  resources :projects
  devise_for :user
  resources :user

  root to: "home#index"
end
