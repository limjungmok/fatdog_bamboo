# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(u_id: "admin",
			 u_pwd:"1234",
			 u_pwd_confirmation:"1234",
			)

Board.create!(b_category: "연애",
			  b_content: "연애 테스트",
			  b_pwd: "test",
			  b_click_count: 5,
			  b_like: 2)

Board.create!(b_category: "학과",
			  b_content: "학과 테스트",
			  b_pwd: "test",
			  b_click_count: 2,
			  b_like: 1)


Board.create!(b_category: "기타",
			  b_content: "기타 테스트",
			  b_pwd: "test",
			  b_click_count: 15,
			  b_like: 12)


Board.create!(b_category: "건의",
			  b_content: "건의 테스트",
			  b_pwd: "test",
			  b_click_count: 35,
			  b_like: 32)


Board.create!(b_category: "연애",
			  b_content: "연애 테스트",
			  b_pwd: "test",
			  b_click_count: 25,
			  b_like: 32)


Board.create!(b_category: "기타",
			  b_content: "기타 테스트",
			  b_pwd: "test",
			  b_click_count: 15,
			  b_like: 42)

