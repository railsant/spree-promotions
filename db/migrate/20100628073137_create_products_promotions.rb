class CreateProductsPromotions < ActiveRecord::Migration
  def self.up
    create_table :products_promotions, :id => false do |t|
      t.integer :product_id, :null => false
      t.integer :promotion_id, :null => false
    end
  end

  def self.down
    drop_table :products_promotions
  end
end