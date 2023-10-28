class CreateAsignees < ActiveRecord::Migration[7.1]
  def change
    create_table :asignees do |t|
      t.string :name
      t.boolean :is_coach
      t.timestamps
    end
  end
end
