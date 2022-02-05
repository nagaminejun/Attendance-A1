class RemoveAuthorFromTitles < ActiveRecord::Migration[5.1]
  def change
    remove_column :bases, :string, :string
  end
end
