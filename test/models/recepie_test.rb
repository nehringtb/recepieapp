require 'test_helper'

class RecepieTest < ActiveSupport::TestCase
	def setup
		@recepie = Recepie.new(name: 'vegetable soup', description: "Great food")
	end	

	test "recepie should be valid" do
		assert @recepie.valid?
	end

	test "name should be present" do
		@recepie.name = " "
		assert_not @recepie.valid?
	end

	test "description should be present" do
		@recepie.description = " "
		assert_not @recepie.valid?
	end
	
	test 'description shouldnt be less than 5 chars' do
		@recepie.description = "a" * 3
		assert_not @recepie.valid?
	end

	test 'description shouldnt be more thant 500 chars' do
		@recepie.description = "a" * 501
		assert_not @recepie.valid?
	end

end
