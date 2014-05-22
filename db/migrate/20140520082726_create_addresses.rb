class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string     :street
      t.string     :building
      t.string     :unit
      t.string     :city
      t.string     :zip_code
      t.references :company, index: true
    end
  end
end