class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.belongs_to :location
      t.belongs_to :asignee
      t.datetime :start_at, null: false
      t.datetime :end_at
      t.timestamps
    end
  end
end
