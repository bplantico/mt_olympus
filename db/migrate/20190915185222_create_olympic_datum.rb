class CreateOlympicDatum < ActiveRecord::Migration[6.0]
  def change
    create_table :olympic_data do |t|
      t.string :name
      t.string :sex
      t.integer :age
      t.integer :height
      t.integer :weight
      t.string :team
      t.string :games
      t.string :sport
      t.string :event
      t.string :medal

      t.timestamps
    end
  end
end
