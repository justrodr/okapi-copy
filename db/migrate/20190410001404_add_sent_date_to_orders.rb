class AddSentDateToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :sent_date, :datetime
  end
end
