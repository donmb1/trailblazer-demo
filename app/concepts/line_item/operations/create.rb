# creates a new line item in a given cart

module LineItem::Operations
  class Create < BaseOperation
    step :init_product
    step :add_line_item_to_cart

    def init_product(ctx, params:, **)
      ctx[:product] = Product.find_by_id params[:product_id]
      return true if ctx[:product]
      return false
    end

    def add_line_item_to_cart(ctx, cart:, **)
      ctx[:line_item] = LineItem.find_or_create_by(cart: cart, product: ctx[:product])
      ctx[:line_item].qty += 1
      ctx[:line_item].save!
      return true
    end

  end
end
