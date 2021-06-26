class CreateInterviews < ActiveRecord::Migration[6.1]
  def change
    create_table :interviews do |t|
      t.integer :application_id
      t.string :interviewer
      t.string :iv_email
      t.date :iv_date

      t.timestamps
    end
  end
end
