class AddUserToUserrequest < ActiveRecord::Migration[6.1]
  def change
    add_reference :userrequests, :user, null: false, foreign_key: true
  end
end
