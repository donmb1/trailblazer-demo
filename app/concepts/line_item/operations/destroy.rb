# removes a new line item from a given cart

module LineItem::Operations
  class Destroy < BaseOperation
    step :find_model
    step :destroy_model

    def find_model(ctx, params:, cart:, **)
      ctx[:model] = cart.line_items.find params[:id]
      return true if ctx[:model]
      return false
    end

    def destroy_model(ctx, **)
      ctx[:model].destroy
    end

  end
end
