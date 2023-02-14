class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :school
      t.integer :language_id
      t.integer :user_id

      t.timestamps
    end
  end
end
