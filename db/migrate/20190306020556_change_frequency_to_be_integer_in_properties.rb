class ChangeFrequencyToBeIntegerInProperties < ActiveRecord::Migration
  def change
    change_column :properties, :frequency, :integer
  end
end
