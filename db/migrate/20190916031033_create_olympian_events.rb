class CreateOlympianEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :olympian_events do |t|
      t.references :olympian, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.string :medal

      t.timestamps
    end
  end
end
