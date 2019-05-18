class ChangeSentDate < ActiveRecord::Migration
  def change
    change_column :orders, :sent_date, :string
    change_column :orders, :delivered_date, :string
  end
end
