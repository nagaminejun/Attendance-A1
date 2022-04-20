class AddOverRequestStatusToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :over_request_status, :string, default: "なし"
  end
end
