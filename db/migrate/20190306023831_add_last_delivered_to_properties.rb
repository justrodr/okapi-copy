class AddLastDeliveredToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :last_delivered, :datetime
  end
end
