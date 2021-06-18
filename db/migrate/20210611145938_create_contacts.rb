class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.integer :application_id
      t.string :first_name
      t.string :last_name
      t.string :suffix
      t.string :email
      t.string :profile_url

      t.timestamps
    end
  end
end
