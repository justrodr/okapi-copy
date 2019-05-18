class AddFieldsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :city, :string
    add_column :orders, :state, :string
    add_column :orders, :zipcode, :string
    add_column :orders, :frequency, :integer
    add_column :orders, :price, :float
    add_column :orders, :start_date, :datetime
    add_column :orders, :delivered_date, :datetime
  end
end
