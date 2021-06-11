class CreateConversations < ActiveRecord::Migration[6.1]
  def change
    create_table :conversations do |t|
      t.integer :contact_id
      t.string :content
      t.date :contact_date

      t.timestamps
    end
  end
end
