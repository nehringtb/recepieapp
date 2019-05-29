require 'test_helper'

class RecipesEditTest < ActionDispatch::IntegrationTest

  def setup
		@chef = Chef.create(chefname:"Thomas", email: "email@email.com")
		@recipe = Recipe.create(name: "recipe1", description: "desc1", chef: @chef)
  end

  test 'reject invalid recipe update' do
    get edit_recipe_path(@recipe)
    assert_template 'recipes/edit'
    patch recipe_path(@recipe), params: { recipe: { name: ' ', description: 'some description' } }
    assert_template 'recipes/edit'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end

  test 'successfully edit a recipe' do
    get edit_recipe_path(@recipe)
    updated_name = 'test updated name'
    updated_description = 'test updated description'
    patch recipe_path(@recipe), params: {recipe: {name: updated_name, description: updated_description} }
    assert_redirected_to @recipe
    assert_not flash.empty?
    @recipe.reload
    assert_match updated_name, @recipe.name
    assert_match updated_description, @recipe.description
  end
end
