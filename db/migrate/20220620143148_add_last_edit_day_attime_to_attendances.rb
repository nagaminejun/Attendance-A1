class AddLastEditDayAttimeToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :last_edit_day_started_at, :datetime
    add_column :attendances, :last_edit_day_finished_at, :datetime
  end
end
