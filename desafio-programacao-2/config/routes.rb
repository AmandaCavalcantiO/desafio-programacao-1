Rails.application.routes.draw do

  resources :purchase_orders
  root 'purchase_orders#index'
  post '/purchase_orders/import', to: 'purchase_orders#import'
end
