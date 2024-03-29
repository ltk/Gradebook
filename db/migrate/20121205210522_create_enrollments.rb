class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer :user_id
      t.integer :course_id
      t.decimal :grade, :precision => 3, :scale => 2

      t.timestamps
    end
  end
end
