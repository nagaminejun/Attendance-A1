class AddEditOneMonthCheckConfirmToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :edit_one_month_check_confirm, :boolean
  end
end
