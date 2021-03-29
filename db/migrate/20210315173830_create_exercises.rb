class CreateExercises < ActiveRecord::Migration[6.1]
  def change
    create_table :exercises do |t|
      t.text :name
      t.integer :time
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end
  end
end
