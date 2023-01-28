class AddDefaultValueForCounters < ActiveRecord::Migration[7.0]
  def self.up 
    change_column :posts, :likes_counter, :integer, default: 0
    change_column :posts, :comments_counter, :integer, default: 0
    change_column :users, :post_counter, :integer, default: 0
  end

  def self.down
    # Rollback
    change_column :posts, :likes_counter, :integer, default: nil
    change_column :posts, :comments_counter, :integer, default: nil
    change_column :users, :post_counter, :integer, default: nil
  end
  
end
