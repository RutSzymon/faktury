class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :invoice, index: true
      t.references :product, index: true
      t.integer    :quantity

      t.timestamps
    end
  end
end