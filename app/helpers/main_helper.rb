# Helper methods defined here can be accessed in any controller or view in the application

Portfolio.helpers do
  def site_title(options = {})
    base        = options[:base]       ||= ""
    separator   = options[:separator]  ||= ""
    page        = options[:page]       ||= nil
    title       = base.to_s

    title = "#{title} #{separator} #{page}" unless page.nil?

    title
  end
end
