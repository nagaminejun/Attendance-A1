class AddEditDayCheckConfirmToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :edit_day_check_confirm, :boolean
  end
end
