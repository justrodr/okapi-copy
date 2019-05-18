class AddSubscriptionFrequencyToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :sub_freq, :integer
    rename_column :orders, :frequency, :filter_freq
  end
end
