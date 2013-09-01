class CreateAvailabilityStatuses < ActiveRecord::Migration
  def change
    create_table :availability_statuses do |t|
      t.references :user, index: true
      t.references :workday, index: true
      t.integer :available, :default => 2
      t.boolean :on_wishlist, :default => false
      t.string :comments

      t.timestamps
    end
  end
end
