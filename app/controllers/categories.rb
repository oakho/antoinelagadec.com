Portfolio.controllers :categories do
  # get :index, :map => "/foo/bar" do
  #   session[:foo] = "bar"
  #   render 'index'
  # end

  # get :sample, :map => "/sample/url", :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   "Maps to url '/foo/#{params[:id]}'"
  # end

  # get "/example" do
  #   "Hello world!"
  # end

  get :index, with: :slug do
    slug = params[:slug].downcase

    case slug
      when "projects"
        @title = "Here's some projects I worked on"
        @projects = Project.find_by_category("Projects")
        render 'categories/projects'
      when "photos"
        @title = "Here's some photos I took"
        @projects = Project.find_by_category("Photos")
        render 'categories/photos'
      when "musics"
        @title = "Here's some musics I composed"
        render 'categories/musics'
    end
  end
end
