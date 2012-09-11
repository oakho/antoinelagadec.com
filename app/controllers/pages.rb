Portfolio.controller do
  get "/about" do
    @title = "Hello there,"
    render 'pages/about'
  end
  get "/" do
    @title = "Hello !"
    render 'index/index'
  end
end