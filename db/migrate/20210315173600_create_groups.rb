# frozen_string_literal: true

class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.text :name
      t.text :icon
      t.integer :user_id
      t.integer :exercise_id

      t.timestamps
    end
  end
end
