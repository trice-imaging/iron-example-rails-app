class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :delay, default: 0
      t.boolean :should_fail,  default: false
      t.integer :runs, default: 0

      t.timestamps null: false
    end
  end
end
