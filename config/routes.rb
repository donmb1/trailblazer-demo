Rails.application.routes.draw do

  resources :line_items, only: [:create, :destroy]

  root 'shops#index'

end
