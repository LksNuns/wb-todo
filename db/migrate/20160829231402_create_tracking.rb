class CreateTracking < ActiveRecord::Migration[5.0]
  def change
    create_table :trackings do |t|
      t.string :event
      t.text :data
    end
  end
end
