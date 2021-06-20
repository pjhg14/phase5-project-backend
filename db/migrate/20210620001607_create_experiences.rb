class CreateExperiences < ActiveRecord::Migration[6.1]
  def change
    create_table :experiences do |t|
      t.integer :user_id
      t.string :title
      t.string :exp_type
      t.string :description
      t.date :completion_date

      t.timestamps
    end
  end
end
