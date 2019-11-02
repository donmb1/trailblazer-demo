# creates a new cart if no cart cookie is available
# assigns new cart model

module Cart::Operations
  class CreateLineItem < BaseOperation
    step :init_cart
    step :init_product
    step :add_line_item_to_cart

    def init_cart(ctx, params:, **)
      ctx[:cart] = Cart.find_by_id params[:cart_id]
      return true if ctx[:cart]
      return false
    end

    def init_product(ctx, params:, **)
      ctx[:product] = Product.find_by_id params[:product_id]
      return true if ctx[:product]
      return false
    end

    def add_line_item_to_cart(ctx, **)
      ctx[:line_item] = LineItem.create(cart: ctx[:cart], product: ctx[:product])
      return true
    end

  end
end
