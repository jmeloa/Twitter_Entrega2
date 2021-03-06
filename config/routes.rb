Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :friends
    
  resources :tweet_posts do
    resources :likes
  end
  
  get 'api/:fecha1/:fecha2', to: 'api#search'
  get 'api/news', to: 'api#news'
  post 'api/create', to: 'api#create_tweet' 
  
  
  
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  resources :likes
  resources :tweet_posts
  devise_for :users, controllers:{registrations: 'registrations'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  
end
