Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', confirmations: 'users/confirmations' }
  get 'likes/new'
  get 'likes/create'
  
  root 'users#index'
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create] do
      resources :comments, only: %i[new create]
      resources :likes, only: %i[new create]
    end
  end
end
