class AddEditOneMonthRequestSuperiorToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :edit_one_month_request_superior, :integer
  end
end
