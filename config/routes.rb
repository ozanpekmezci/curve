Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments
    resource :like, module: :posts #likes controller yerine direk post/likes oluyo
    collection do
      get :autocomplete
    end
  end
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" ,registrations: 'registrations'}
  resources :users, only: [:show,:index] do
      member do
        get :following, :followers
      end
  end
  resources :relationships, only: [:create, :destroy]
  resources :tags, only: [:show] do
      member do
        post :follow
        delete :unfollow
      end
  end
  resources :messages, only: [:new, :create]
  resources :conversations, only: [:index, :show, :destroy] do
      member do
        post :reply
        post :restore
        post :mark_as_read
      end
      collection do
        delete :empty_trash

    end
  end
  resources :notifications do
    member do
      post :mark_as_read
    end
  end
  resources :chats do
    resources :fires
  end
  resources :orders do
    member do
      post :initiate
    end
  end

  # to get one user's posts to show them on his profile
  # get 'users/:id/posts' => 'Users#posts', :as => :user_posts

  root 'posts#index'
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup


#  devise_scope :user do
#    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
#  end
end
