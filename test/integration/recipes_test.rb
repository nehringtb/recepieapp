require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest
	
	def setup
		@chef = Chef.create(chefname:"Thomas", email: "email@email.com")
		@recipe = Recipe.create(name: "recipe1", description: "desc1", chef: @chef)
		@recipe2 = Recipe.create(name: "recipe2", description: "desc2", chef: @chef)
	end

	test "should get recipes index" do
		get recipes_url
		assert_response :success
	end
	
	test 'should get recipes listing' do
		get recipes_path
		assert_template 'recipes/index'
		assert_match @recipe.name, response.body
		assert_match @recipe2.name, response.body
	end
end
