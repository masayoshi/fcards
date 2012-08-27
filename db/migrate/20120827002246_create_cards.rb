class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.text :front
      t.text :back
      t.datetime :next_study_datetime
      t.integer :deck_id

      t.timestamps
    end

    add_index :cards, [:deck_id, :next_study_datetime]
  end
end
