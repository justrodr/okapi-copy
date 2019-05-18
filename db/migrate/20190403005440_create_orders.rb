class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :shipping_address
      t.string :tenant_name
      t.string :tenant_email
      t.integer :size10b20
      t.integer :size14b20
      t.integer :size16b24
      t.integer :size18b30
      t.integer :size12b12
      t.integer :size14b24
      t.integer :size16b25
      t.integer :size20b20
      t.integer :size12b20
      t.integer :size14b25
      t.integer :size18b18
      t.integer :size20b24
      t.integer :size12b24
      t.integer :size14b30
      t.integer :size18b20
      t.integer :size20b25
      t.integer :size12b30
      t.integer :size15b20
      t.integer :size18b24
      t.integer :size20b30
      t.integer :size12b36
      t.integer :size16b20
      t.integer :size18b25
      t.integer :size24b24
      t.integer :size25b25
      t.integer :property
      t.string :order_status
      t.integer :user
      t.float :amount_paid

      t.timestamps null: false
    end
  end
end
