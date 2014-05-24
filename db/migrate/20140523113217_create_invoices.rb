class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.date       :date
      t.integer    :payment_time
      t.references :contractor, index: true

      t.timestamps
    end
  end
end