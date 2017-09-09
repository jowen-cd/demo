Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    resources :friendships, only: [:index, :create, :destroy]

    resources :messages, only: [:index, :create, :update, :destroy] do
      patch :read, on: :member
    end
  end
end
