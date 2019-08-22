require 'test_helper'

class ChefsEditTest < ActionDispatch::IntegrationTest
 
  def setup
    @chef = Chef.new(chefname: "Thomas", email: "Test@test.test", password: "password", password_confirmation: "password") 
    @chef.save
  end


  test 'reject an invalid edit' do
    get edit_chef_path(@chef)
    assert_template "chefs/edit" 
    patch chef_path(@chef), params: { chef: { chefname: ' ', email: 'thomasnehring@outlook.com'} }	
    assert_template 'chefs/edit'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
  
  test 'accept a valid edit' do
    get edit_chef_path(@chef)
    assert_template "chefs/edit" 
    patch chef_path(@chef), params: { chef: { chefname: 'Thomas1', email: 'thomasnehring1@outlook.com'} }	
    assert_redirect_to @chef
    assert_not flas.empty?
    @chef.reload
    assert_match 'Thomas1', @chef.name
    assert_match 'Thomasnehring1@outlook.com', @chef.email
  end

end
