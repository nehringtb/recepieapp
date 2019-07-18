require 'test_helper'

class ChefsShowTest < ActionDispatch::IntegrationTest
  
  def setup
    @chef = Chef.new(chefname: "Test Chef", email: "Test@test.test", password: "password", password_confirmation: "password") 
		@chef.save
		@recipe = Recipe.create(name: "recipe1", description: "desc1", chef: @chef)
		@recipe2 = Recipe.create(name: "recipe2", description: "desc2", chef: @chef)
  end

  test "should get chefs show" do
    get chef_path(@chef)
    assert_template 'chefs/show'
    assert_select "a[href=?]", recipe_path(@recipe), text: @recipe.name
    assert_select "a[href=?]", recipe_path(@recipe2), text: @recipe2.name
    assert_match @recipe.description, response.body
    assert_match @recipe2.description, response.body
    assert_match @chef.chefname, response.body
  end


end
