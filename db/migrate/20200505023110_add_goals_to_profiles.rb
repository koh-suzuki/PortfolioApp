class AddGoalsToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :weight_goal, :float
    add_column :profiles, :body_fat_goal, :float
  end
end
