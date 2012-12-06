class AddEnrollmentsCountAndTeachingAssignmentsCountToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :enrollments_count, :integer
    add_column :courses, :teaching_assignments_count, :integer
  end
end
