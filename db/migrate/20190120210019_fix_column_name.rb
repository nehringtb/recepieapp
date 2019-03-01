class FixColumnName < ActiveRecord::Migration[5.2]
  def change
	rename_column :recepies, :email, :description
  end
end
