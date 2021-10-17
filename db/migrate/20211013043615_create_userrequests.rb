class CreateUserrequests < ActiveRecord::Migration[6.1]
  def change
    create_table :userrequests do |t|
      t.string :news
      t.string :purpose

      t.timestamps
    end
  end
end
