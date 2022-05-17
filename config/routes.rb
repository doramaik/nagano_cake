Rails.application.routes.draw do
  devise_for :order_details
  namespace :admin do
  end
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
