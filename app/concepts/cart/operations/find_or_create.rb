# creates a new cart if no cart cookie is available
# assigns new cart model

module Cart::Operations
  class FindOrCreate < BaseOperation
    step :find_or_create

    def find_or_create(ctx, cookies:, **)
      ctx[:model] = Cart.find_or_create_by(id: cookies[:cart])
      return true if ctx[:model]
      return false
    end

  end
end
