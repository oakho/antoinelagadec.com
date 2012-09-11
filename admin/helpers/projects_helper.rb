# Helper methods defined here can be accessed in any controller or view in the application

Admin.helpers do
  def category_checked? category, project
    project.categories.include? category
  end
  def get_joined_tags project
    project.tags.map{ |tag| tag.name }.join(" ") if defined? project.tags
  end
end
