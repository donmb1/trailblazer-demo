class AddQtyToLineItems < ActiveRecord::Migration[6.0]
  def change
    add_column :line_items, :qty, :integer, default: 0
  end
end
