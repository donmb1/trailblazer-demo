class ApplicationController < ActionController::Base

  before_action :set_cart

  def set_cart
    result = ::Cart::Operations::FindOrCreate.(cookies: cookies)
    @cart = result[:model] if result.success?
  end

end
