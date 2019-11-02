class ApplicationController < ActionController::Base

  before_action :init_cart

private
  def init_cart
    if cookies[:cart]
      @cart = Cart.find_by_id cookies[:cart]
    end
  end

end
