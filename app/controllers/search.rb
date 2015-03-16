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
    p =  Post.where("title LIKE ? OR body LIKE ?", 
                         "%#{search}%","%#{search}%").order(created_at: :DESC)
    r = Recipe.where("title LIKE ? ", "%#{search}%").order(created_at: :DESC)
    @posts = (r + p).sort_by(&:created_at)
    
    render 'search/index'
  end

end
