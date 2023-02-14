class AddMoreDataToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :phone, :string
    add_column :users, :role, :integer
    add_column :users, :address, :string
    add_column :users, :status, :string
    add_column :users, :school_id, :integer
    add_column :users, :country_id, :integer
  end
end
