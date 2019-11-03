class LineItemsController < ApplicationController

  def create
    result = ::LineItem::Operations::Create.(params: params, cart: @cart)

    redirect_to root_url
  end

  def destroy
    result = ::LineItem::Operations::Destroy.(params: params, cart: @cart)

    redirect_to root_url
  end

end
