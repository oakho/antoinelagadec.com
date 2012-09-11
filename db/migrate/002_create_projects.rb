class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.string :slug
      t.text :body
      t.string :url
      t.string :cover_uid
      t.string :cover_name
      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
