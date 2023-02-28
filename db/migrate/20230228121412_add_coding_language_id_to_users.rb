class AddCodingLanguageIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :coding_language_id, :integer
  end
end
