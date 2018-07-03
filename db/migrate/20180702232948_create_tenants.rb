class CreateTenants < ActiveRecord::Migration[5.2]
  def change
    create_table :tenants do |t|
      t.string :first_name
      t.string :last_name
      t.integer :failed_requests, default: 0
      t.integer :successful_requests, default: 0
      t.boolean :private_question, default: false
      t.string :api_key

      t.timestamps
    end
  end
end
