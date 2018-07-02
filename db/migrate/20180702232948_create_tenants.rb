class CreateTenants < ActiveRecord::Migration[5.2]
  def change
    create_table :tenants do |t|
      t.string :first_name
      t.string :last_name
      t.integer :failed_requests
      t.integer :successful_requests
      t.string :api_key

      t.timestamps
    end
  end
end
