class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :description
      t.string :location
      t.date :start_date, null: false
      t.time :start_time
      t.date :end_sate, null: false
      t.time :end_time
      t.boolean :all_day, null: false, default: false

      t.timestamps null: false
    end
  end
end
