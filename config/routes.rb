Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root 'tweets#index'
  resources :tweets do
    collection do
      post :like_tweet
      post :unlike_tweet
    end
  end
  resources :comments do
    collection do
      post :create_tweet_comment
    end
  end
end
