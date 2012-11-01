# Helper methods defined here can be accessed in any controller or view in the application

Portfolio.helpers do

  def page(name)
    content_for :page do
      concat_content name
    end

    yield_content :page
  end

  def category(name)
    content_for :categories do
      concat_content name
    end

    yield_content :categories
  end

  def title(options = {})
    base        = options[:base]             ||= settings.site_title_base
    separator   = options[:separator]        ||= settings.site_title_separator
    page        = yield_content(:page)       || page(options[:page])
    category    = yield_content(:categories) || category(options[:categories])

    title = ""

    title << "#{page} "     << "#{separator} " unless page.empty?
    title << "#{category} " << "#{separator} " unless category.empty?
    title << "#{base}"                         unless base.empty?

    content_for :title do
      concat_content title
    end

    yield_content :title
  end

end
