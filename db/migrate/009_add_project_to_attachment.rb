class AddProjectToAttachment < ActiveRecord::Migration
  def self.up
    change_table :attachments do |t|
      t.integer :project_id
    end
  end

  def self.down
    change_table :attachments do |t|
      t.remove :project_id
    end
  end
end