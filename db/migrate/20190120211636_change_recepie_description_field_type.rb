class ChangeRecepieDescriptionFieldType < ActiveRecord::Migration[5.2]
  def change
	change_column :recepies, :description, :text
  end
end
