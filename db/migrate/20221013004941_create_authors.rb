class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|

      t.timestamps
      t.string :name, null: false
    end
  end
end
