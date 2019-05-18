class AddNextShipDateToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :next_ship_date, :string
  end
end