class AddProjectIdToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :project_id, :integer
  end
end
