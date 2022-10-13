class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|

      t.timestamps
      t.string :title, null: false
      t.integer :author_id, null: false
      t.integer :genre_id, null: false
    end
  end
end
