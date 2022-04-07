class ChangeDataToUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :designated_work_start_time, :time, default: Time.current.change(hour: 9, min: 0, sec: 0)
    change_column :users, :designated_work_end_time, :time, default: Time.current.change(hour: 18, min: 0, sec: 0)
  end
end
