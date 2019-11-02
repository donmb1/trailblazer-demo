class ShopsController < ApplicationController

  def index
    result = ::Cart::Operations::Create.(cookies: cookies)
    cookies[:cart] = result[:model].id if result.success?

    @products = Product.all
  end

end
