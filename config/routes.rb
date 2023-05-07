Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    root to: 'homes#top'
    get 'users_search' => 'searches#users_search'
    get 'posts_search' => 'searches#posts_search'
    resources :users, only: [:index, :show, :destroy]
    resources :posts, only: [:index, :show, :destroy]
  end

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }
  # ユーザーログイン画面をルートパスにする
  # scope module: :users do
  #   root 'sessions#new'
  # end
  scope module: :user do
    get 'users_search' => 'searches#users_search'
    get 'posts_search' => 'searches#posts_search'
    get 'users/mypage' => 'users#mypage', as: 'mypage'
    get 'users/information/edit' => 'users#edit', as: 'edit_information'
    patch 'users/information' => 'users#update', as: 'update_information'
    delete 'users/information' => 'users#destroy', as: 'destroy_information'
    get 'users/:id' => 'users#show', as: 'show_user'
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    resources :posts do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:index, :create, :destroy]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
