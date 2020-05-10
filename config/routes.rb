Rails.application.routes.draw do
  resources :notifications
  resources :images
  root to: "images#new"
end
