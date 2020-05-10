Rails.application.routes.draw do
  devise_for :users
  # :skip => [:registrations, :sessions]

  # as user do
  # # Registrations
  # get   '/signup'   => 'users/registrations#new', as: :new_user_registration
  # post  '/signup'   => 'users/registrations#create', as: :user_registration
  # end
  resources :notifications
  resources :images
  root to: "application#index"
end
