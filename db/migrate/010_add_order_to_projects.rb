class AddOrderToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.integer :order, default: 0
    end
    Project.update_all(order: 0)
  end

  def self.down
    change_table :projects do |t|
      t.remove :order
    end
  end
end
