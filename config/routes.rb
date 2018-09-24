Rails.application.routes.draw do

  devise_for :users

  resources :destinations do
    resources :reviews
  end

  resources :activities

  resources :users do
    resources :reviews
  end

  resources :excursions ## require activity(s) and destination
end
