# Helper methods defined here can be accessed in any controller or view in the application

Admin.helpers do
  def nav_show_module? project_module
    ! settings.nav_disabled_module.include?(project_module.name)
  end
end
