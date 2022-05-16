Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users

  root 'tweets#index'

  resources :tweets do
    collection do
      get :latest_tweets
    end
  end

  resources :likes

  resources :comments do
    collection do
      post :create_tweet_comment
    end
  end

  resources :relationships

  resources :users do
    collection do
      get :suggested_followers
    end
    member do
      get :following_list
      get :followers_list
    end
  end

end
