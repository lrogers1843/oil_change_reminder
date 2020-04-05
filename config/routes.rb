Rails.application.routes.draw do
  resources :notifications
  resources :images
  root to: "application#index"
end
