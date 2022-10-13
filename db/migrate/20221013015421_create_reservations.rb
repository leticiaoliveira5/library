class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|

      t.timestamps
      t.integer :user_id, null: false
      t.integer :book_id, null: false
      t.integer :status
      t.datetime :devolution
    end
  end
end
