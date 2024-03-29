class Category < ActiveRecord::Base

  has_and_belongs_to_many :projects

  validates_presence_of :name

  def to_s
    name
  end

end
