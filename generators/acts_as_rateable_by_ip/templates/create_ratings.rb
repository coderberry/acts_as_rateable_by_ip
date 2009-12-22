class CreateRatings < ActiveRecord::Migration

  def self.up
    create_table :ratings do |t|
      t.string   :ip_address, :limit => 19
      t.integer  :rating
      t.references :rateable, :polymorphic => true
      t.timestamps
    end

    add_index :ratings, :rateable_type
    add_index :ratings, :rateable_id
    add_index :ratings, :ip_address
  end

  def self.down
    drop_table :ratings
  end

end