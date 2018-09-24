Rails.application.routes.draw do

  devise_for :users

  resources :destinations 

  resources :activities

  resources :reviews


  resources :excursions ## require activity(s) and destination
end
