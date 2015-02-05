Blog::App.controllers :users do
  
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
    @user = User.new
    render 'users/new'
  end
  post :create, params:[:user] do
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Welcome aboard"
      redirect url('/')
    else
      render 'users/new'
    end

  end
  
  get :edit, :map => '/users/:id/edit' do
    @user = User.find_by_id(params[:id])
    unless @user
      redirect('/')
    end
    render '/users/edit'
  end
  put :update, :map => '/users/:id' do
   @user = User.find_by_id(params[:id])
  unless @user
    flash[:error] = "User is not registered in our platform."
    render '/users/edit'
   
  end

  if @user.update_attributes(params[:user])
    flash[:notice] = "You have updated your profile."
    redirect('/')
  else
    flash[:error] = "Your profile was not updated."
    render '/users/edit'
  end
end
end
