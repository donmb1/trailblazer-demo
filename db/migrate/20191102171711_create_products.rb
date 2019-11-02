class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'uuid-ossp'

    create_table :products, id: :uuid, default: 'uuid_generate_v4()' do |t|
      t.string :name
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
