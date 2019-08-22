class RenameReceipeToRecipe < ActiveRecord::Migration[5.2]
  def change
  	rename_table :recepies, :recipes
  end
end
