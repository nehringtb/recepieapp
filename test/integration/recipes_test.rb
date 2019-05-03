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
		assert_select "a[href=?]", recipe_path(@recipe), text: @recipe.name
		assert_select "a[href=?]", recipe_path(@recipe2), text: @recipe2.name
	end

	test 'should get recipes show' do
		get recipe_path(@recipe)
		assert_template 'recipes/show'
		assert_match @recipe.name.capitalize, response.body
		assert_match @recipe.description, response.body
		assert_match @chef.chefname, response.body
	end
end 
