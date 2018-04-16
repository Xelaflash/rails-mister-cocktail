Rails.application.routes.draw do
  resources :cocktails, only: [:index, :show, :new, :create, :destroy]  do
    resources :doses, only: [:create]
    end

    resources :doses, only: [:destroy]
    resources :ingredients, only: [:show]

    root to: "cocktails#index"
end
