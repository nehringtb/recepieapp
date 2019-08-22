require 'test_helper'

class RecipesDeleteTest < ActionDispatch::IntegrationTest

  def setup
    @chef = Chef.new(chefname: "Thomas", email: "Test@test.test", password: "password", password_confirmation: "password") 
    @chef.save
    @recipe = Recipe.create(name: "recipe1", description: "desc1", chef: @chef)
  end

  test "successfully delete a recipe" do
    get recipe_path(@recipe)
    assert_template "recipes/show"
    assert_difference 'Recipe.count', -1 do
        delete recipe_path(@recipe)
    end
    assert_redirected_to recipes_path
    assert_not flash.empty?
  end
end
