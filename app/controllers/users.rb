Blog::App.controllers :users do
  before :update do 
    correct_user
  end
  
  get :new do
    @user = User.new
    render 'users/new'
  end
  
  post :create do
    @user = User.new(params[:user])
    if @user.save
      log_in(@user)
      flash[:notice] = "Welcome aboard"
      redirect url('/')
    else
      flash[:error] = "There was a problem with your registration"
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
  delete :destroy, :map=>'/users/:id/destroy' do
    @user = User.find(params[:id]).destroy
    if @user
      flash[:notice] = "#{@user.email } was successfully remove from our records"
      redirect_to('/')
    else

      flash[:notice] = " we are unable to process your request at this time"
      redirect_to('/')
    end
  end
 end
