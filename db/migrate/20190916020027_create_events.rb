class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :sport
      t.string :games

      t.timestamps
    end
  end
end
