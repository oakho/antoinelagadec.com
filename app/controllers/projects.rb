Portfolio.controllers :projects do

  get :index, with: :slug do
    @project = Project.find_by_slug(params[:slug])
    render 'projects/show'
  end

end
