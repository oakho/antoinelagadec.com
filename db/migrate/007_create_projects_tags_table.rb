class CreateProjectsTagsTable < ActiveRecord::Migration
  def self.up
    create_table :projects_tags, :id => false do |t|
        t.references :project
        t.references :tag
    end
    add_index :projects_tags, [:project_id, :tag_id]
    add_index :projects_tags, [:tag_id, :project_id]
  end

  def self.down
    drop_table :projects_tags
  end
end
