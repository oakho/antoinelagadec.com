class Attachment < ActiveRecord::Base
  attachment_accessor :file
  has_one :project
end
