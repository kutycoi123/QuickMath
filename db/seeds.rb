# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

class SfuDepAPI
	include HTTParty
	base_uri "http://www.sfu.ca/bin/wcm/course-outlines"
	def getDepartments(term,year=Time.zone.now.year)
		self.class.get("?#{year}/#{term.downcase}")
	end
end

class SfuCourseAPI
	include HTTParty
	base_uri "http://www.sfu.ca/bin/wcm/course-outlines"
	def getCourses(department,term,year=Time.zone.now.year)
		self.class.get("?#{year}/#{term.downcase}/#{department.downcase}")
	end
end

term="spring"
empty=0
dep_api = SfuDepAPI.new
dep_json = dep_api.getDepartments(term)
dep_list = dep_json.parsed_response
dep_list.each do |y|
	begin
	
	course_api =	SfuCourseAPI.new
	course_json = course_api.getCourses("#{y["value"]}",term)
	course_list = course_json.parsed_response

	course_list.each do |x|
		 Course.create!(name: y["text"] + " " + x["text"], title: x["title"], description: "")
	end
rescue
	next
end
 end
seedUser = {"Rafid" => "rpranta@sfu.ca", "Lam Nguyen" => "tln3@sfu.ca", 
				"Shayna" => "sgrose@sfu.ca", "Angad" => "asa217@sfu.ca"}
seedUser.each do |key, value|
	User.create(name: key, email: value, password: "123456", password_confirmation: "123456", 
				activated: true, 
 				activated_at: Time.zone.now)
end
# user = User.create!(name: "testuser",
# 				email: "testuser123@gmail.com",
# 				password: "123456", 
# 				password_confirmation: "123456", 
# 				activated: true, 
# 				activated_at: Time.zone.now)

# user1 = User.create!(name: "testuser1",
# 				email: "testuser1234@gmail.com",
# 				password: "123456", 
# 				password_confirmation: "123456",
# 				activated: true,
#              	activated_at: Time.zone.now)

# courseFolder_1 = CourseFolder.create!(name: "CMPT 276",
# 						  title: "Introduction to Software Engineering",
# 						  year: 2018, term: "Spring", user_id: 1)
# courseFolder_2 = CourseFolder.create!(name: "CMPT 295",
# 						  title: "Introduction to Operating Systems",
# 						  year: 2018, term: "Spring", user_id: 2)

# user.course_folders << courseFolder_1
# user1.course_folders << courseFolder_2
