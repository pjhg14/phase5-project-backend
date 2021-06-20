class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.integer :user_id
      t.string :name
      t.date :project_date
      t.boolean :completed

      t.timestamps
    end
  end
end
