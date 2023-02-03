Rails.application.routes.draw do
  # get '/users', to: 'users#index'
  # get '/users/:user_id', to: 'users#show'
  # get '/users/:user_id/posts', to: 'posts#index'
  # get '/users/:user_id/posts/new', to: 'posts#new'
  # post 'posts', to: 'posts#create'
  # get '/users/:user_id/posts/:post_id', to: 'posts#show'

  root 'users#index'
  resources :users do
    resources :posts do 
      resources :comments
      resources :likes
    end
  end
end
