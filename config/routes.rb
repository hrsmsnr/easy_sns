Rails.application.routes.draw do

  # 管理者側
  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    root to: 'homes#top'
    resources :users, only: [:index,:show,:update,:destroy]
    resources :posts, only: [:index,:show,:update,:destroy] do
      resources :comments, only: [:update,:destroy]
    end
  end

  # ユーザー側
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'users/my_page' => 'users#show'
    resources :users, only: [:index,:show,:edit,:update] do
      resource :relationships, only: [:create, :destroy]
      get 'follows' => 'users#follows', as: 'follows'
      get 'followers' => 'users#followers', as: 'followers'
    end
    get 'users/:id/unsubsribe' => 'users#unsubscribe'
    patch 'users/:id/withdraw' => 'users#withdraw'
    
    
    # get 'posts/:category' => 'posts#index'
    # get 'posts/:category/new' => 'posts#new'
    
    #カテゴリ別のタブ分けができたら上二つに切り替え 
    resources :posts, only: [:new,:index,:show,:create,:edit,:update,:destroy] do
      resources :comments, only: [:create,:destroy]
      resource :favorite, only: [:create, :destroy]
    end

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
