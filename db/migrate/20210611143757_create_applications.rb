class CreateApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :applications do |t|
      t.integer :user_id
      t.integer :business_id
      t.string :alias
      t.string :role
      t.date :apply_date
      t.date :start_date
      t.string :wage_type
      t.float :wage

      t.timestamps
    end
  end
end
