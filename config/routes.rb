# frozen_string_literal: true

Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  resources :cocktails do
    resources :doses, only: [:create]
    resources :ingredients, only: [:create]
  end

  resources :doses, only: [:destroy]
  resources :ingredients, only: [:destroy]

  root to: 'cocktails#index'
end
