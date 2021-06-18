class CreateBusinesses < ActiveRecord::Migration[6.1]
  def change
    create_table :businesses do |t|
      t.integer :user_id
      t.string :name
      t.string :address
      t.string :field
      t.string :motto
      t.string :about
      t.string :description

      t.timestamps
    end
  end
end
