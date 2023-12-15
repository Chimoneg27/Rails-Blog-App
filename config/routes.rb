Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', confirmations: 'users/confirmations' }
  get 'likes/new'
  get 'likes/create'
  
  root 'users#index'
  resources :users, only: %i[index show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: %i[new create]
    end
  end
end
