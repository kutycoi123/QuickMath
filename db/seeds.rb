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
# departArray = []
  # begin
    # puts 'I am before the raise.'
    # raise 'An error has occured.'
    # puts 'I am after the raise.'
empty=0
dep_api = SfuDepAPI.new
dep_json = dep_api.getDepartments(term)
dep_list = dep_json.parsed_response
dep_list.each do |y|
	begin
	# if empty==1
	# 	empty=0
	# 	next
	# end
	 # next if y["value"]=='bot'
	 # next if y["value"]=='ddp'
	 # next if y["value"]=='exch'
 	# rescue Exception=>e
	#  puts "Error #{e}"
	  # puts y["value"]
# 	departArray.push(y["value"])
	course_api =	SfuCourseAPI.new
	# course_json = course_api.getCourses(y["value"],"spring")
	course_json = course_api.getCourses("#{y["value"]}",term)
	course_list = course_json.parsed_response
# 	if $!
# 	next
# end
	course_list.each do |x|
		  # puts x["title"]
		 Course.create!(name: y["text"] + " " + x["text"], title: x["title"], description: "")
	end
rescue
	next
end
 end
# rescue
# 	empty=1
# 	retry
# end

#
# class SfuAPI
# 	include HTTParty
# 	base_uri "http://www.sfu.ca/bin/wcm/course-outlines"
# 	def getCourses(department,term,year=Time.zone.now.year)
# 		self.class.get("?#{year}/#{term.downcase}/#{department.downcase}")
# 	end
# end
#
# course_api=SfuAPI.new
# course_json=course_api.getCourses("BISC","spring")
# course_list=course_json.parsed_response
# course_list.each do|x|
# 	Course.create!(name: "CMPT #{x["text"]}", title: x["title"], description: "")
# end
user = User.create!(name: "testuser",
				email: "testuser123@gmail.com",
				password: "123456", 
				password_confirmation: "123456", 
				activated: true, 
				activated_at: Time.zone.now)

user1 = User.create!(name: "testuser1",
				email: "testuser1234@gmail.com",
				password: "123456", 
				password_confirmation: "123456",
				activated: true,
             	activated_at: Time.zone.now)

courseFolder_1 = CourseFolder.create!(name: "CMPT 276",
						  title: "Introduction to Software Engineering",
						  year: 2018, term: "Spring", user_id: 1)
courseFolder_2 = CourseFolder.create!(name: "CMPT 295",
						  title: "Introduction to Operating Systems",
						  year: 2018, term: "Spring", user_id: 2)

# user.course_folders << courseFolder_1
# user1.course_folders << courseFolder_2
