class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'uuid-ossp'
    create_table :carts, id: :uuid, default: 'uuid_generate_v4()' do |t|

      t.timestamps
    end
  end
end
