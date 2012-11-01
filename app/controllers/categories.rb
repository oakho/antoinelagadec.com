Portfolio.controllers :categories do

  get :index, with: :slug do
    @slug = params[:slug].downcase
    case @slug
      when "projects"
        @projects = Project.find_by_category("Projects")
        render 'categories/projects'
      when "photos"
        @projects = Project.find_by_category("Photos")
        render 'categories/photos'
      when "musics"
        render 'categories/musics'
    end
  end

end
