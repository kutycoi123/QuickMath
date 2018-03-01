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
course_1 = Course.create!(name: "CMPT 276",
						  title: "Introduction to Software Engineering",
						  description: "Required course for co-op")
course_2 = Course.create!(name: "CMPT 295",
						  title: "Introduction to operator system",
						  description: "Required course for co-op")
note_1 = Note.create!(course_name: "CMPT 276",
					  title: "Lecture 1-10",
					  description: "",
					  user_id: 1,
					  course_id: 1)
note_2 = Note.create!(course_name: "CMPT 295",
					  title: "Lecture 1-10",
					  description: "",
					  user_id: 1,
					  course_id: 2)
note_3 = Note.create!(course_name: "CMPT 276",
					  title: "Lecture 11-20",
					  description: "",
					  user_id: 2,
					  course_id: 1)
user.courses << course_1
user.courses << course_2
user1.courses << course_1