class CreateCategoriesProjectsTable < ActiveRecord::Migration
  def self.up
    create_table :categories_projects, :id => false do |t|
        t.references :project
        t.references :category
    end
    add_index :categories_projects, [:project_id, :category_id]
    add_index :categories_projects, [:category_id, :project_id]
  end

  def self.down
    drop_table :categories_projects
  end
end
