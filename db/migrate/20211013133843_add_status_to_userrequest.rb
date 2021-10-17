class AddStatusToUserrequest < ActiveRecord::Migration[6.1]
  def change
    add_column :userrequests, :status, :string
  end
end
