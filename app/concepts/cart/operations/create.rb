# creates a new cart if no cart cookie is available
# assigns new cart model

module Cart::Operations
  class Create < BaseOperation
    step :check_cart_cookie
    step :create_new_cart

    def check_cart_cookie(ctx, cookies:, **)
      return false if cookies[:cart]
      return true
    end

    def create_new_cart(ctx, **)
      ctx[:model] = Cart.create
    end

  end
end
