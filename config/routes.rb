Rails.application.routes.draw do
  # 商品出品まで行ったらresourcesでまとめる
  devise_for :users
  get 'items/index'
  root to: "items#index"
end
