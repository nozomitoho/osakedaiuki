Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show] do
      member do
          get :following, :followers
      end
    end
    resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'games#top'
  get "games/top" =>'games#top'
  get "games/app" =>'games#app'
  resources :games do
    resources :likes, only: [:create, :destroy]
  end
end
