class CreateOlympians < ActiveRecord::Migration[6.0]
  def change
    create_table :olympians do |t|
      t.string :name
      t.string :sex
      t.integer :age
      t.integer :height
      t.integer :weight
      t.string :team

      t.timestamps
    end
  end
end
