class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.string :keywords
      t.jsonb :params
      t.timestamps
    end

    add_index :searches, :keywords
  end
end
