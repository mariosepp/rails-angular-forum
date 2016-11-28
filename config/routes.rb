Rails.application.routes.draw do
  devise_for :users
    root to: 'application#angular'

    resources :posts, only: [:create, :destroy, :index, :show] do
      resources :comments, only: [:show, :destroy, :create] do
      end
    end
  end
