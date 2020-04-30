class CreateHealths < ActiveRecord::Migration[5.2]
  def change
    create_table :healths do |t|
      t.integer :weight
      t.integer :body_fat
      t.integer :weight_goal
      t.integer :body_fat_goal
      t.date :day
      t.boolean :bowel_movement, null: false, default: false
      t.boolean :water, null: false, default: false
      t.datetime :bedtime_at
      t.datetime :getuptime_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
