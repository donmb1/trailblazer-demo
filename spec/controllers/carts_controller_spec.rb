require 'rails_helper'

RSpec.describe CartsController, :type => :controller do

  describe 'GET #create_line_item' do

    before do
      @cart = ::Cart::Operations::FindOrCreate.(cookies: cookies)[:model]
      request.cookies[:cart] = @cart.id
    end

    let!(:product) { create(:product) }

    context 'for no line_items exist' do
      it 'should add a line item to the cart' do
        expect{ get :create_line_item, params: { cart_id: @cart.id, product_id: product.id } }.to change{@cart.line_items.count}.by(1)
      end
    end

    context 'for existing line items' do
      let!(:line_item) { ::Cart::Operations::CreateLineItem.(params: { product_id: product.id }, cart: @cart)[:model] }

      it 'should set the last line item qty to 2' do
        get :create_line_item, params: { cart_id: @cart.id, product_id: product.id }
        expect(LineItem.last.qty).to eq 2
      end
    end

  end

end
