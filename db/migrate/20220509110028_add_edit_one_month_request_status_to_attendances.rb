class AddEditOneMonthRequestStatusToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :edit_one_month_request_status, :string
  end
end
