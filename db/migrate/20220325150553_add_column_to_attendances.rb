class AddColumnToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :next_day, :string #stringは文字列だよ
  end
end
