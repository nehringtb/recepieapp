require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
	def setup
		@chef = Chef.new(chefname: "Thomas", email: "Test@test.test", password: "password", password_confirmation: "password") 
		@chef.save
		@recipe = @chef.recipes.build(name: 'vegetable soup', description: "Great food")
	end	

	test "recipe should be valid" do
		assert @recipe.valid?
	end


	test "recepie without chef should be invalid" do
		@recipe.chef_id = nil
		assert_not @recipe.valid?
	end
	
	test "name should be present" do
		@recipe.name = " "
		assert_not @recipe.valid?
	end

	test "description should be present" do
		@recipe.description = " "
		assert_not @recipe.valid?
	end
	
	test 'description shouldnt be less than 5 chars' do
		@recipe.description = "a" * 3
		assert_not @recipe.valid?
	end

	test 'description shouldnt be more thant 500 chars' do
		@recipe.description = "a" * 501
		assert_not @recipe.valid?
	end

end
