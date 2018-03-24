# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create!(name: "testuser",
				email: "testuser123@gmail.com",
				password: "123456", password_confirmation: "123456")
user1 = User.create!(name: "testuser1",
				email: "testuser1234@gmail.com",
				password: "123456", password_confirmation: "123456")
courseFolder_1 = CourseFolder.create!(name: "CMPT 276",
						  title: "Introduction to Software Engineering",
						  year: 2018, term: "Spring", user_id: 1)
courseFolder_2 = CourseFolder.create!(name: "CMPT 295",
						  title: "Introduction to Operating Systems",
						  year: 2018, term: "Spring", user_id: 2)
course_1 = Course.create(name: "CMPT 295", title: "Introduction to Operating Systems", description: "")
course_2 = Course.create(name: "CMPT 276", title: "Introduction to Software Engineering", description: "")

# user.course_folders << courseFolder_1
# user1.course_folders << courseFolder_2
