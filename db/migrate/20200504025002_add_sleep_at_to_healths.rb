class AddSleepAtToHealths < ActiveRecord::Migration[5.2]
  def change
    add_column :healths, :sleep_at, :datetime
  end
end
