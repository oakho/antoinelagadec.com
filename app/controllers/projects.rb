Portfolio.controllers :projects do
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

  set :controller, "Projects"

  get :index do
    @title = "Here's some projects I made"
    @projects = Project.find_by_category("Projects")
    render 'projects/index'
  end

  get :index, with: :slug do
    @project = Project.find_by_slug(params[:slug])
    @title = @project.name
    render 'projects/show'
  end
end
