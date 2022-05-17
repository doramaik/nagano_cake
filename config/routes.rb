Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers




  namespace :admin do
    root to: "homes#top"
    #会員
    resources :customers
    #ジャンル
    resources :genres
    #商品
    resources :items
    #注文
    resources :orders
  end

  namespace :public do
    root to: "homes#top"
    #住所
    resources :addresses
    #カート商品
    resources :cart_items
    delete "cart_items", to: 'cart_items#destroy_all'
    #商品
    resources :items
    #注文
    resources :orders
    post "orders/confirm", to: 'orders#confirm'
    get "orders/thanks", to: 'orders#thanks'
    #home
    resources :homes

    get "home/about" => 'homes#about'
    #会員
    resources :customers
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
