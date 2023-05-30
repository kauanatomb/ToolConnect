class RemoveColumnNameFromTableName < ActiveRecord::Migration[7.0]
  def change
    remove_column :tools, :photo, :string
  end
end
