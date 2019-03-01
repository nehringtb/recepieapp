require 'test_helper'

class ChefTest < ActiveSupport::TestCase

	def setup
		@chef = Chef.new(chefname: "Thomas", email: "Test@test.test") 
	end

	test "should be valid" do
		 assert @chef.valid?
	end

	test "name should be present" do
		@chef.chefname= " "
		assert_not @chef.valid?
	end

	test "name should be less than 30 charactars" do
		@chef.chefname = "a" * 31
		assert_not @chef.valid?
	end

	test "email should be correct format" do
		valid_emails =  %w[user@example.com TEST@TEST.COM ASHLEY@SOMETHING.COM TEST.TEST@GOOGLE.CA]
		valid_emails.each do |valids|
			@chef.email = valids	
			assert @chef.valid?, "#{valids.inspect} should be valid"
		end
	end

	test "should reject invalid addresses" do

		invalid_emails = %w[invalid invalid@wlh@.com test@test,com valid@notvalid.sadflaskdjflj]	
		invalid_emails.each do |invalids|
			@chef.email = invalids	
			assert_not @chef.valid?, "#{invalids.inspect} should not be valid"
		end
	end

	test "email should be unique and case insensitive" do
		duplicate_chef = @chef.dup
		duplicate_chef.email = @chef.email.upcase
		@chef.save
		assert_not duplicate_chef.valid?
	end

	test "email should be case insensitive" do

	end
end
