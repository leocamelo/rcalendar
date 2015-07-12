class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :description
      t.string :location
      t.datetime :started_at, null: false
      t.datetime :ended_at
      t.boolean :all_day, null: false, default: false

      t.timestamps null: false
    end
  end
end
