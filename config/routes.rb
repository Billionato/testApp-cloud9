Rails.application.routes.draw do
  
  devise_for :users

  resources :quotes do
    resources :contexts
    member do
      put "like",    to: "quotes#upvote"
      put "dislike", to: "quotes#downvote"
    end
  end
  
  root 'quotes#index'
end
