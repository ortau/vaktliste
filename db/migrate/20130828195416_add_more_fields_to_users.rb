class AddMoreFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_column :users, :phone, :string
    add_column :users, :started_date, :date, :default => Time.now
    add_column :users, :quit_date, :date
    add_column :users, :active, :boolean, :default => true
  end
end
