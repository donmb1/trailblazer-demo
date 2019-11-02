class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'uuid-ossp'

    create_table :line_items, id: :uuid, default: 'uuid_generate_v4()' do |t|
      t.string :cart_id
      t.string :product_id

      t.timestamps
    end
  end
end
