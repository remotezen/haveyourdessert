Blog::App.controllers :comments do
  before :create do
    logged_in?
    correct_user
  end
  before :new do
    logged_in?
  end
  
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
  
  get :new do
    render '/comments/new'

  end

  post :create do

    post = Post.find_by_id(params[:post_id])
    params[:user_id] = current_user.id
    hash = {  
      user_id: params[:user_id],
      comment: params[:comment]
    }  

    @comment = Comment.new(hash)
    @comment.post = post
    if @comment.save
      flash[:info] = "Your comment was saved"
      redirect url('/#comment')
    else
      flash[:warning] = "There was problem saving your posted  comment"
      redirect url_for(:sessions, :new)
    end
  end

end
