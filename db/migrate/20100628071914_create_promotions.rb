class CreatePromotions < ActiveRecord::Migration
  def self.up
    create_table :promotions do |t|
      t.string :name, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :promotions
  end
end
