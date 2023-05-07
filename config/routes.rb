Rails.application.routes.draw do
  
  # 使用しないdeviseのルーティングをスキップ
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }
  # ユーザーログイン画面をルートパスにする
  # scope module: :users do
  #   root 'sessions#new'
  # end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
