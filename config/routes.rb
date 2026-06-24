Rails.application.routes.draw do
  # 商品出品まで行ったらresourcesでまとめる
  devise_for :users
  root to: "items#index"

  resources :items, only: [:index, :new, :create, :show]
end
