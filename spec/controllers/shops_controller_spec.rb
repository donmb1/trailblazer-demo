require 'rails_helper'

RSpec.describe ShopsController, :type => :controller do

  describe 'GET #index' do

    let!(:product) { create(:product) }

    it 'should set the cart' do
      get :index
      cart = Cart.last
      expect(assigns(:cart)).to eq cart
    end

    it 'should assign products' do
      get :index
      expect(assigns(:products)).to include product
    end

  end

end
