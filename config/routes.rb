Rails.application.routes.draw do


  # дергаем спец. девайзовский метод, который генерит все нужные ему пути
  devise_for :users

  root "events#index"

  resources :events do
    resources :comments, only: [:create, :destroy]
    resources :subscriptions, only: [:create, :destroy]
    resources :photos, only: [:create, :destroy]
    post :show, on: :member
  end

  resources :users, only: [:show, :edit, :update]



end
