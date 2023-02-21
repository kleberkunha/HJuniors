class CreateDegrees < ActiveRecord::Migration[7.0]
  def change
    create_table :degrees do |t|

      t.timestamps
    end
  end
end
