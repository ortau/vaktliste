class CreateWorkdays < ActiveRecord::Migration
  def change
    create_table :workdays do |t|
      t.date :date
      t.decimal :hours
      t.integer :person_1_id
      t.integer :person_2_id
      t.integer :season_id
      t.string :notes

      t.timestamps
    end
  end
end
