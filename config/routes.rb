Rails.application.routes.draw do

  resources :carts, only: [] do
    get :create_line_item
  end

  root 'shops#index'

end
