Rails.application.routes.draw do
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  devise_for :users
  resources :users, only: [:show] do
      member do
          get :following, :followers
      end
    end
  
  resources :relationships, only: [:create, :destroy]

  
  root 'games#top'

  get "games/top" =>'games#top'
  get "games/app" =>'games#app'

  resources :games do
    resources :likes, only: [:create, :destroy]
  end

  resources :playlists do
    resources :playlistgames, only: [:create, :destroy]
  end

end
