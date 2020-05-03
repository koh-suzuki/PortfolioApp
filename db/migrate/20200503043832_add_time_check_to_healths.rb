class AddTimeCheckToHealths < ActiveRecord::Migration[5.2]
  def change
    add_column :healths, :time_check, :boolean, null: false, default: false
  end
end
