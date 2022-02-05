class CreateBases < ActiveRecord::Migration[5.1]
  def change
    create_table :bases do |t|
      t.integer :base_id
      t.string :base_name
      t.string :base_type
      t.string :string

      t.timestamps
    end
  end
end
