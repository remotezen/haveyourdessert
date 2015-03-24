Blog::App.controllers :posts do
  
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
  

  get :index, provides: [:html, :rss, :atom], cache: true do
    expires 180
    @posts = Post.order(created_at: :desc)
    render 'posts/index', layout: 'no_mast_head.erb'
  end
  
  get :show, :with => :id do
    @post = Post.find_by_permalink(params[:id])
    if @post
    render 'bases/index'
    else
      flash[:notice] = "no posts meet your criteria"
       render 'errors/index'
    end
  end

end
