class AddSemesterIndexToCourses < ActiveRecord::Migration
  def up
    add_index :courses, :semester_id
  end
  def down
    remove_index :courses, :column => :semester_id
  end
end
