class Project < ActiveRecord::Base
  belongs_to              :account
  has_many                :attachments
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :tags

  accepts_nested_attributes_for :attachments
  accepts_nested_attributes_for :categories
  accepts_nested_attributes_for :tags

  attachment_accessor :cover

  validates_presence_of :name
  validates_presence_of :body
  validates_presence_of :cover

  def cover_url
    self.cover.url
  end

  def cover_blurred_url
    self.cover.convert('-blur 0x6').url
  end
end
