class AddTimestampToTasks < ActiveRecord::Migration[5.0]
  def change
    add_timestamps(:tasks)
  end
end
