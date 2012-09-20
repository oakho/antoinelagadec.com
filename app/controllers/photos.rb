Portfolio.controllers :photos do
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

  get :index do
    @title = "Here's some photos I took"
    @photos = Project.find_by_category("Photos")
    render 'photos/index'
  end

  get :index, with: :slug do
    @photo = Project.find_by_slug(params[:slug])
    @title = @photo.name
    render 'photos/show'
  end
end
