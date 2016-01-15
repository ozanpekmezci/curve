Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments
  end
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :users, only: [:show,:index] do
      member do
        get :following, :followers
      end
  end
  resources :relationships, only: [:create, :destroy]
  # to get one user's posts to show them on his profile
  # get 'users/:id/posts' => 'Users#posts', :as => :user_posts

  root 'posts#index'
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
