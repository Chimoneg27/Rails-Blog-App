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

  post "users/:id/generate_token" => "users#generate_token", as: :generate_token

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [] do
        resources :posts, only: [:index, :create] do
          resources :comments, only: [:index, :create]
        end
      end
    end
  end
end
