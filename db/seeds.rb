# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def iterate_users(users_data, users_object_array)
  users_data.each do |user|
    User.find_or_initialize_by_email(user[:email]).tap do |u|
      u.type = user[:type]
      u.first_name = user[:first_name]
      u.last_name = user[:last_name]
      u.password = user[:password]
      u.password_confirmation = user[:password_confirmation]
      u.save!
      users_object_array << u
    end
  end
end

semester_data = [
  { name: 'Spring 2012', start_date: '2012-01-01', end_date: '2012-05-20'},
  { name: 'Fall 2012', start_date: '2012-08-20', end_date: '2012-12-31'},
  { name: 'Spring 2013', start_date: '2013-01-01', end_date: '2013-05-20'},
  { name: 'Fall 2013', start_date: '2013-08-20', end_date: '2013-12-31'}
]

semesters = Semester.create(semester_data)

course_data = [
  { name: 'Intro Biology', code: 'Bio 101', description: 'Introductory Biology', semester: semesters[0] },
  { name: 'Intro Comp Sci', code: 'CompSci 101', description: 'Introductory Computer Science', semester: semesters[0] },
  { name: 'Intro Pharmacology', code: 'Pharm 101', description: 'Introductory Pharmacology', semester: semesters[0] },
  { name: 'Intro Philosophy', code: 'Phil 101', description: 'Introductory Philosophy', semester: semesters[0] },
  { name: 'Intro French', code: 'French 101', description: 'Introductory French', semester: semesters[0] },

  { name: 'Intermediate Biology', code: 'Bio 103', description: 'Intermediate Biology', semester: semesters[1] },
  { name: 'Intermediate Comp Sci', code: 'CompSci 103', description: 'Intermediate Computer Science', semester: semesters[1] },
  { name: 'Intermediate Pharmacology', code: 'Pharm 103', description: 'Intermediate Pharmacology', semester: semesters[1] },
  { name: 'Intermediate Philosophy', code: 'Phil 103', description: 'Intermediate Philosophy', semester: semesters[1] },
  { name: 'Intermediate French', code: 'French 103', description: 'Intermediate French', semester: semesters[1] },

  { name: 'Advanced Biology', code: 'Bio 190', description: 'Advanced Biology', semester: semesters[2] },
  { name: 'Advanced Comp Sci', code: 'CompSci 190', description: 'Advanced Computer Science', semester: semesters[2] },
  { name: 'Advanced Pharmacology', code: 'Pharm 190', description: 'Advanced Pharmacology', semester: semesters[2] },
  { name: 'Advanced Philosophy', code: 'Phil 190', description: 'Advanced Philosophy', semester: semesters[2] },
  { name: 'Advanced French', code: 'French 190', description: 'Advanced French', semester: semesters[2] },

]

courses = []

course_data.each do |course|
  Course.find_or_initialize_by_name(course[:name]).tap do |c|
    c.semester = course[:semester]
    c.code = course[:code]
    c.description = course[:description]
    c.save!
    courses << c
  end
end

# courses = Course.create(course_data)

student_data = [
  { first_name: 'Bradley', last_name: 'Wiggins', type: 'Student', email: 'brad@gradebook.edu', password: 'correct horse battery staple', password_confirmation: 'correct horse battery staple' },
  { first_name: 'Cadel', last_name: 'Evans', type: 'Student', email: 'cadel@gradebook.edu', password: 'correct horse battery staple', password_confirmation: 'correct horse battery staple' },
  { first_name: 'Andy', last_name: 'Schleck', type: 'Student', email: 'andy@gradebook.edu', password: 'correct horse battery staple', password_confirmation: 'correct horse battery staple' },
  { first_name: 'Alberto', last_name: 'Contador', type: 'Student', email: 'alberto@gradebook.edu', password: 'correct horse battery staple', password_confirmation: 'correct horse battery staple' },
  { first_name: 'Lance', last_name: 'Armstrong', type: 'Student', email: 'lance@gradebook.edu', password: 'correct horse battery staple', password_confirmation: 'correct horse battery staple' },
  { first_name: 'Carlos', last_name: 'Sastre', type: 'Student', email: 'carlos@gradebook.edu', password: 'correct horse battery staple', password_confirmation: 'correct horse battery staple' },
  { first_name: 'Oscar', last_name: 'Pereiro', type: 'Student', email: 'oscar@gradebook.edu', password: 'correct horse battery staple', password_confirmation: 'correct horse battery staple' },
  { first_name: 'Marco', last_name: 'Pantani', type: 'Student', email: 'marco@gradebook.edu', password: 'correct horse battery staple', password_confirmation: 'correct horse battery staple' },
  { first_name: 'Jan', last_name: 'Ullrich', type: 'Student', email: 'jan@gradebook.edu', password: 'correct horse battery staple', password_confirmation: 'correct horse battery staple' },
  { first_name: 'Bjarne', last_name: 'Riis', type: 'Student', email: 'bjarne@gradebook.edu', password: 'correct horse battery staple', password_confirmation: 'correct horse battery staple' }
  
]
admin_data = [
  { first_name: 'Lawson', last_name: 'Kurtz', type: 'Administrator', email: 'lawson@gradebook.edu', password: 'correct horse battery staple', password_confirmation: 'correct horse battery staple' }
]
teacher_data = [
  { first_name: 'Albert', last_name: 'Einstein', type: 'Teacher', email: 'albert@gradebook.edu', password: 'correct horse battery staple', password_confirmation: 'correct horse battery staple' },
  { first_name: 'Marie', last_name: 'Curie', type: 'Teacher', email: 'marie@gradebook.edu', password: 'correct horse battery staple', password_confirmation: 'correct horse battery staple' },

  { first_name: 'Stephen', last_name: 'Hawking', type: 'Teacher', email: 'stephen@gradebook.edu', password: 'correct horse battery staple', password_confirmation: 'correct horse battery staple' },
  { first_name: 'Niels', last_name: 'Bohr', type: 'Teacher', email: 'niels@gradebook.edu', password: 'correct horse battery staple', password_confirmation: 'correct horse battery staple' },
  { first_name: 'Richard', last_name: 'Feynman', type: 'Teacher', email: 'richard@gradebook.edu', password: 'correct horse battery staple', password_confirmation: 'correct horse battery staple' },
]

students = []
admins = []
teachers = []

iterate_users(student_data, students)
iterate_users(admin_data, admins)
iterate_users(teacher_data, teachers)

enrollment_data = [
  { course_id: courses[0].id, user_id: students[0].id, grade: 4.00 },
  { course_id: courses[0].id, user_id: students[1].id, grade: 3.30 },
  { course_id: courses[0].id, user_id: students[2].id, grade: 3.70 },
  { course_id: courses[0].id, user_id: students[3].id, grade: 2.00 },
  { course_id: courses[0].id, user_id: students[4].id, grade: 1.00 },

  { course_id: courses[1].id, user_id: students[0].id, grade: 2.70 },
  { course_id: courses[1].id, user_id: students[1].id, grade: 2.00 },
  { course_id: courses[1].id, user_id: students[2].id, grade: 1.70 },
  { course_id: courses[1].id, user_id: students[3].id, grade: 2.70 },
  { course_id: courses[1].id, user_id: students[4].id, grade: 0.00 },

  { course_id: courses[2].id, user_id: students[0].id, grade: 4.00 },
  { course_id: courses[2].id, user_id: students[1].id, grade: 4.00 },
  { course_id: courses[2].id, user_id: students[2].id, grade: 3.00 },
  { course_id: courses[2].id, user_id: students[3].id, grade: 3.30 },
  { course_id: courses[2].id, user_id: students[4].id, grade: 4.00 },

  { course_id: courses[3].id, user_id: students[0].id, grade: 3.70 },
  { course_id: courses[3].id, user_id: students[1].id, grade: 3.30 },
  { course_id: courses[3].id, user_id: students[2].id, grade: 3.00 },
  { course_id: courses[3].id, user_id: students[3].id, grade: 3.30 },
  { course_id: courses[3].id, user_id: students[4].id, grade: 0.70 },

  { course_id: courses[4].id, user_id: students[0].id, grade: 4.30 },
  { course_id: courses[4].id, user_id: students[1].id, grade: 3.30 },
  { course_id: courses[4].id, user_id: students[2].id, grade: 3.00 },
  { course_id: courses[4].id, user_id: students[3].id, grade: 3.30 },
  { course_id: courses[4].id, user_id: students[4].id, grade: 1.00 },

  { course_id: courses[5].id, user_id: students[0].id },
  { course_id: courses[5].id, user_id: students[1].id },
  { course_id: courses[5].id, user_id: students[2].id },
  { course_id: courses[5].id, user_id: students[3].id },
  { course_id: courses[5].id, user_id: students[4].id },

  { course_id: courses[6].id, user_id: students[0].id },
  { course_id: courses[6].id, user_id: students[1].id },
  { course_id: courses[6].id, user_id: students[2].id },
  { course_id: courses[6].id, user_id: students[3].id },
  { course_id: courses[6].id, user_id: students[4].id },

  { course_id: courses[7].id, user_id: students[0].id },
  { course_id: courses[7].id, user_id: students[1].id },
  { course_id: courses[7].id, user_id: students[2].id },
  { course_id: courses[7].id, user_id: students[3].id },
  { course_id: courses[7].id, user_id: students[4].id },

  { course_id: courses[8].id, user_id: students[0].id },
  { course_id: courses[8].id, user_id: students[1].id },
  { course_id: courses[8].id, user_id: students[2].id },
  { course_id: courses[8].id, user_id: students[3].id },
  { course_id: courses[8].id, user_id: students[4].id },

  { course_id: courses[9].id, user_id: students[0].id },
  { course_id: courses[9].id, user_id: students[1].id },
  { course_id: courses[9].id, user_id: students[2].id },
  { course_id: courses[9].id, user_id: students[3].id },
  { course_id: courses[9].id, user_id: students[4].id },

  { course_id: courses[10].id, user_id: students[0].id },
  { course_id: courses[10].id, user_id: students[1].id },
  { course_id: courses[10].id, user_id: students[2].id },
  { course_id: courses[10].id, user_id: students[3].id },
  { course_id: courses[10].id, user_id: students[4].id },

  { course_id: courses[11].id, user_id: students[0].id },
  { course_id: courses[11].id, user_id: students[1].id },
  { course_id: courses[11].id, user_id: students[2].id },
  { course_id: courses[11].id, user_id: students[3].id },
  { course_id: courses[11].id, user_id: students[4].id },

  { course_id: courses[12].id, user_id: students[0].id },
  { course_id: courses[12].id, user_id: students[1].id },
  { course_id: courses[12].id, user_id: students[2].id },
  { course_id: courses[12].id, user_id: students[3].id },
  { course_id: courses[12].id, user_id: students[4].id },

  { course_id: courses[13].id, user_id: students[0].id },
  { course_id: courses[13].id, user_id: students[1].id },
  { course_id: courses[13].id, user_id: students[2].id },
  { course_id: courses[13].id, user_id: students[3].id },
  { course_id: courses[13].id, user_id: students[4].id },

  { course_id: courses[14].id, user_id: students[0].id },
  { course_id: courses[14].id, user_id: students[1].id },
  { course_id: courses[14].id, user_id: students[2].id },
  { course_id: courses[14].id, user_id: students[3].id },
  { course_id: courses[14].id, user_id: students[4].id }

]

teaching_assignment_data = [
  { course_id: courses[0].id, teacher_id: teachers[2].id },
  { course_id: courses[1].id, teacher_id: teachers[0].id },
  { course_id: courses[2].id, teacher_id: teachers[3].id },
  { course_id: courses[3].id, teacher_id: teachers[4].id },
  { course_id: courses[4].id, teacher_id: teachers[1].id },
  { course_id: courses[5].id, teacher_id: teachers[2].id },
  { course_id: courses[6].id, teacher_id: teachers[0].id },
  { course_id: courses[7].id, teacher_id: teachers[3].id },
  { course_id: courses[8].id, teacher_id: teachers[4].id },
  { course_id: courses[9].id, teacher_id: teachers[1].id },
  { course_id: courses[10].id, teacher_id: teachers[2].id },
  { course_id: courses[11].id, teacher_id: teachers[0].id },
  { course_id: courses[12].id, teacher_id: teachers[3].id },
  { course_id: courses[13].id, teacher_id: teachers[4].id },
  { course_id: courses[14].id, teacher_id: teachers[1].id }
]

enrollments = []
teaching_assignments = []

enrollment_data.each do |enrollment|
  Enrollment.new.tap do |e|
    e.user_id = enrollment[:user_id]
    e.course_id = enrollment[:course_id]
    e.grade = enrollment[:grade] if enrollment[:grade]
    e.save!
    enrollments << e
  end
end

teaching_assignment_data.each do |ta|
  TeachingAssignment.new.tap do |t|
    t.teacher_id = ta[:teacher_id]
    t.course_id = ta[:course_id]
    t.save!
    teaching_assignments << t
  end
end



