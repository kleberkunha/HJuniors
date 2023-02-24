class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :name
      t.integer :country_id
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.string :link

      t.timestamps
    end
  end
end
