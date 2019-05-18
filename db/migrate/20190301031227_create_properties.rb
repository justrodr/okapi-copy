class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :user
      t.string :prop_name
      t.string :tenant_name
      t.string :tenant_email
      t.string :tenant_phone
      t.string :address
      t.string :frequency

      t.timestamps null: false
    end
  end
end
