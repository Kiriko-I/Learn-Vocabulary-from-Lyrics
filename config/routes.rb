Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :user, skip: [:sessions, :passwords], controllers: {
    registrations: "user/registrations",
    # sessions: 'user/sessions'
  }
  devise_scope :user do
    get '/' => 'user/sessions#new', as: 'new_user_session'
    post 'user/sign_in' => 'user/sessions#create', as: 'user_session'
    delete 'user/sign_out' => 'user/sessions#destroy', as: 'destroy_user_session'
    post 'user/guest_sign_in', to: 'user/sessions#guest_sign_in'
  end
  
  namespace :admin do
    root to: 'homes#top'
    get 'users_search' => 'searches#users_search'
    get 'posts_search' => 'searches#posts_search'
    resources :users, only: [:index, :show, :destroy]
    resources :posts, only: [:index, :show, :destroy]
  end

  scope module: :user do
    get 'users_search' => 'searches#users_search'
    get 'posts_search' => 'searches#posts_search'
    get 'posts/favorites' => 'favorites#index'
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
      resource :favorites, only: [:create, :destroy]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
