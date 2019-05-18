class ChangeUserToBeIntegerInProperties < ActiveRecord::Migration
  def change
    change_column :properties, :user, :integer
  end
end
