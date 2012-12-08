class CreateTeachingAssignments < ActiveRecord::Migration
  def change
    create_table :teaching_assignments do |t|
      t.integer :teacher_id
      t.integer :course_id

      t.timestamps
    end
  end
end
