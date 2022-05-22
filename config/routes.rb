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
    resources :cart_items
    delete "cart_items", to: 'cart_items#destroy_all'
    #商品
    resources :items
    #注文
    resources :orders
    post "orders/confirm", to: 'orders#confirm'
    get "orders/thanks", to: 'orders#thanks'


    #会員
    resources :customers , only: [:show, :edit, :update]
    get "customers/quit" => 'customers#quit'
    patch "customers/withdraw" => 'customers#withdraw'

  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
