class RemoveNextShipDateFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :next_ship_date
  end
end
