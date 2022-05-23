Rails.application.routes.draw do
 root to: 'homes#top'
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  #home
  get "home/about" => 'homes#about'


  namespace :admin do
    #会員
    resources :customers
    #ジャンル
    resources :genres
    post 'genres/index' => 'genres#index'

    #商品
    resources :items
    #注文
    resources :orders
  end

  namespace :public do

    #住所
    resources :addresses
    #カート商品
    delete "cart_items/destroy_all", to: 'cart_items#destroy_all'
    resources :cart_items

    #商品
    resources :items
    #注文
    post "orders/confirm", to: 'orders#confirm'
    get "orders_order_confirm", to: 'orders#order_confirm'
    get "orders/thanks", to: 'orders#thanks'
    resources :orders , only: [:show, :new, :create, :index]
    #会員
    resources :customers , only: [:show, :edit, :update]
    get "customers/:id/quit" => 'customers#quit'
    patch "customers/:id/quit" => 'customers#withdraw'

    #検索
    get "search" => "searches#search"

  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
