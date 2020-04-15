# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :cocktails, only: %i[index show new create destroy] do
    resources :doses, only: [:create]
  end

  resources :doses, only: [:destroy]
  resources :ingredients, only: [:show]

  root to: 'cocktails#index'
end
