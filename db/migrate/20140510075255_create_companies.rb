class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string     :name
      t.string     :nip
      t.string     :phone
      t.string     :person
      t.string     :type
    end
  end
end