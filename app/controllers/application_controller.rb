class ApplicationController < ActionController::Base

  before_action :set_cart

  def set_cart
    result = ::Cart::Operations::FindOrCreate.(cookies: cookies)

    if result.success?
      @cart = result[:model]
      cookies[:cart] = @cart.id if !cookies[:cart]
    end
  end

end
