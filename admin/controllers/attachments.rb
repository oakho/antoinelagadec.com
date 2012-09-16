Admin.controllers :attachments do

  get :index do
    @attachments = Attachment.all
    render 'attachments/index'
  end

  get :new do
    @attachment = Attachment.new
    @projects = Project.all
    render 'attachments/new'
  end

  post :create do
    @project              = Project.find(params[:project])
    @attachment           = Attachment.new({ file: params[:attachment][:file][:tempfile] })
    @attachment.file.name = params[:attachment][:file][:filename]
    @project.attachments.push @attachment

    if @project.save
      flash[:notice] = 'Attachment was successfully created.'
      redirect url(:attachments, :edit, :id => @attachment.id)
    else
      render 'attachments/new'
    end
  end

  get :edit, :with => :id do
    @attachment = Attachment.find(params[:id])
    @projects = Project.all
    render 'attachments/edit'
  end

  put :update, :with => :id do
    # To rework to make it work as expected
    @project              = Project.find(params[:project])
    @attachment           = Attachment.new({ file: params[:attachment][:file][:tempfile] })
    @attachment.file.name = params[:attachment][:file][:filename]
    @project.attachments  = [ @attachment ]

    if @project.update_attributes({})
      flash[:notice] = 'Attachment was successfully updated.'
      redirect url(:attachments, :edit, :id => @attachment.id)
    else
      render 'attachments/edit'
    end
  end

  delete :destroy, :with => :id do
    attachment = Attachment.find(params[:id])
    if attachment.destroy
      flash[:notice] = 'Attachment was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Attachment!'
    end
    redirect url(:attachments, :index)
  end
end
