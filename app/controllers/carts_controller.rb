class CartsController < ApplicationController

  def create_line_item
    result = ::Cart::Operations::CreateLineItem.(params: params)

    redirect_to root_url
  end

end
