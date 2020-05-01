# frozen_string_literal: true

Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  resources :cocktails do
    resources :doses, only: %i[create]
    resources :ingredients, only: %i[create]
    resources :reviews, only: %i[create]
  end

  resources :doses, only: %i[destroy]
  resources :ingredients, only: %i[destroy]
  resources :reviews, only: %i[destroy]

  root to: 'cocktails#index'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :cocktails, only: %i[index show] do
        get :photo, on: :member
      end
    end
  end
end
