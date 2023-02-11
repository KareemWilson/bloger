Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_scope :user do
    get '/users/sign_in', to: 'users/sessions#new'
    get '/users/sign_out', to: 'users/sessions#destroy'
  end
  root 'users#index'
  resources :users do
    resources :posts do 
      resources :comments
      resources :likes
    end
  end

  namespace :api do
    namespace :v1 do
      resources :users, format: :json do
        resources :posts, format: :json do
          resources :comments, format: :json
        end
      end
    end
  end
end
