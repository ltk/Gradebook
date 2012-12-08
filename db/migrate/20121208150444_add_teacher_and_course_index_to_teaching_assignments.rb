class AddTeacherAndCourseIndexToTeachingAssignments < ActiveRecord::Migration
  def up
    add_index :teaching_assignments, :teacher_id
    add_index :teaching_assignments, :course_id
  end
  def down
    remove_index :teaching_assignments, :column => :teacher_id
    remove_index :teaching_assignments, :column => :course_id
  end
end
