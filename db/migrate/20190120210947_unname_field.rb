class UnnameField < ActiveRecord::Migration[5.2]
  def change
	rename_column :recepies, :description, :email
  end
end
