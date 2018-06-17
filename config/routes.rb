Rails.application.routes.draw do
#トップページは root によって設定されます
#ルーティングにより、 ToppagesController と index アクション、 toppages/index.html.erb が必要
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers      
    end
    
  end

  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]

  #お気に入り機能用
  get "likes", to: "users#likes"
  resources :favorites, only: [:create, :destroy]
  #お気に入り機能用･･･favorite#createはないのでどうするか
  #post "favorites/:micropost_id/create" => "favorites#create"


end