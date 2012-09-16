class Attachment < ActiveRecord::Base
  attachment_accessor :file

  belongs_to :project
end
