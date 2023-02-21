class AddUserIdToDegrees < ActiveRecord::Migration[7.0]
  def change
    add_column :degrees, :user_id, :integer
  end
end
