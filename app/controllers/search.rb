Blog::App.controllers :search do
  
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
  
  get :index do
    search = params[:search]
    Profiler__.start_profile
    @posts =  Post.where("title LIKE ? OR body LIKE ?", 
                         "%#{search}%","%#{search}%").order(created_at: :DESC)
    Profiler__.stop_profile
    render 'search/index'
  end

end
