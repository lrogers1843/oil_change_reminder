Rails.application.routes.draw do
  devise_for :users
  resources :notifications
  resources :images
  root to: "application#index"
end
