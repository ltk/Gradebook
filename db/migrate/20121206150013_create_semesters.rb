class CreateSemesters < ActiveRecord::Migration
  def change
    create_table :semesters do |t|
      t.integer :courses_count
      t.date :start_date
      t.date :end_date
      t.string :name

      t.timestamps
    end
  end
end
