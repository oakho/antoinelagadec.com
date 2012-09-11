Admin.controllers :projects do

  get :index do
    @projects = Project.all
    render 'projects/index'
  end

  get :new do
    @project = Project.new
    @categories = Category.all
    render 'projects/new'
  end

  post :create do
    # Project
    @project = Project.new(params[:project])
    # Cover
    @project.cover = params[:cover][:tempfile]
    @project.cover.name = params[:cover][:filename]
    # Categories
    @project.categories = params[:categories].map do |id|
      Category.find(id)
    end
    # Tags
    @project.tags = params[:tags].split(" ").map do |name|
      tag = Tag.find_by_name(name)
      tag ? tag : Tag.create({ name: name })
    end

    if @project.save
      flash[:notice] = 'Project was successfully created.'
      redirect url(:projects, :edit, :id => @project.id)
    else
      redirect url(:projects, :new)
    end
  end

  get :edit, :with => :id do
    @project = Project.find(params[:id])
    @categories = Category.all
    render 'projects/edit'
  end

  put :update, :with => :id do
    # Project
    @project = Project.find(params[:id])
    # Cover
    if(!!params[:cover])
      @project.cover = params[:cover][:tempfile]
      @project.cover.name = params[:cover][:filename]
    end
    # Categories
    @project.categories = params[:categories].map do |id|
      Category.find(id)
    end
    # Tags
    @project.tags = params[:tags].split(" ").map do |name|
      tag = Tag.find_by_name(name)
      tag ? tag : Tag.create({ name: name })
    end

    if @project.update_attributes(params[:project])
      flash[:notice] = 'Project was successfully updated.'
      redirect url(:projects, :edit, :id => @project.id)
    else
      render 'projects/edit'
    end
  end

  delete :destroy, :with => :id do
    project = Project.find(params[:id])
    if project.destroy
      flash[:notice] = 'Project was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Project!'
    end
    redirect url(:projects, :index)
  end
end
