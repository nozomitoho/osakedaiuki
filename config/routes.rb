Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'games/index' => 'games#index'
  get 'games/new' => 'games#new'
  get 'games/show' => 'games#show'
  post 'games' => 'games#create'
  get 'games/:id' => 'games#show',as: 'game'
end
