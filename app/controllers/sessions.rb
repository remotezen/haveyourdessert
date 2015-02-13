Blog::App.controllers :sessions do
  
  get :new do
    render 'sessions/new'

  end
  
  post :create do
    user = User.authenticate(params[:email], params[:password])
    if user 
      session[:user_id] = user.id
      flash[:notice] = "Logged in"
      redirect url('/')
    else
      redirect url('/') 
    end
  end
  
  get :destroy do
    log_out
    flash[:notice] = "Logged out!"
    redirect url('/')
  end

end
