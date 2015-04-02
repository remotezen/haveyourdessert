Blog::App.controllers :bases do
  register Padrino::Cache

  
  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end
  
  get :index, :cache => true do
    expires 180
    @post = Post.last
    render 'bases/index' 

  end
  get :about do
    render 'bases/about'
  end


end
