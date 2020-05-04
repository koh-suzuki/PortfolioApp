class ChangeDataWeightToHealth < ActiveRecord::Migration[5.2]
  def change
    change_column :healths, :weight, :float
    change_column :healths, :body_fat, :float
    change_column :healths, :weight_goal, :float
    change_column :healths, :body_fat_goal, :float
  end
end
