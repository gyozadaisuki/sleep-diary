class DropDiary < ActiveRecord::Migration[6.0]
  def change
    create_table :diaries do |t|
      t.integer :week
      t.date :date
      t.time :bedtime
      t.time :wakeuptime
      t.time :time_beforesleep
      t.integer :awaken_times
      t.integer :liquor_type
      t.integer :liquor_num
      t.integer :feeling
      t.integer :sleep_quality
      t.time :naptime
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
