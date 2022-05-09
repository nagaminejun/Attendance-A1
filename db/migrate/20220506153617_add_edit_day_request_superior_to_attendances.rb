class AddEditDayRequestSuperiorToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :edit_day_request_superior, :integer
  end
end
