class AddPropindexToUsers < ActiveRecord::Migration
  def change
    add_column :users, :prop_index, :integer
  end
end
