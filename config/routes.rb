Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  resources :users, only: %i[index show edit update] do
    resource :relationships, only: %i[create destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  post 'users/search', to: 'users#search'

  resources :fashions, only: %i[new create index show edit update destroy] do
    resource :favorites, only: %i[create destroy]
    resources :fashion_comments, only: %i[create destroy]
  end

  post 'fashions/search', to: 'fashions#search'

  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'

  resources :relationships, only: %i[create destroy]

  post 'search', to: 'application#search'
end
