class CreateTimeEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :time_entries do |t|
      t.integer :start_at
      t.integer :end_at
      t.date :day
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
