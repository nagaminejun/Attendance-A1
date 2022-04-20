class AddOverRequestSuperiorToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :over_request_superior, :integer
  end
end
