class AddUserAndCourseIndexToEnrollments < ActiveRecord::Migration
  def up
    add_index :enrollments, :user_id
    add_index :enrollments, :course_id
  end
  def down
    remove_index :enrollments, :column => :user_id
    remove_index :enrollments, :column => :course_id
  end
end
