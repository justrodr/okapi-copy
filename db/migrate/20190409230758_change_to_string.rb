class ChangeToString < ActiveRecord::Migration
  def change
    change_column :orders,  :start_date, :string
  end
end
