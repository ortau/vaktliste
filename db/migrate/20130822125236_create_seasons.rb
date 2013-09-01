class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.string :name
      t.date :from_date
      t.date :to_date
      t.string :open_days
      t.string :notes

      t.timestamps
    end
  end
end
