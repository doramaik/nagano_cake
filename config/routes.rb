Rails.application.routes.draw do
  get 'cart_items/index'
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
