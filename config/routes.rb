Rails.application.routes.draw do

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    root to: "orders#top"
    #会員
    resources :customers
    #ジャンル
    resources :genres
    #商品
    resources :items
    #注文
    resources :orders do
      get 'top' => 'orders#top'
    end
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
