Blog::Admin.controllers :steps do
  get :index do
    @title = "Steps"
    @steps = Step.all
    render 'steps/index'
  end

  get :new, :with => '(:id)' do
    @id = params[:id]
    @title = pat(:new_title, :model => 'step')
    @step = Step.new
    render 'steps/new'
  end

  post :create do
    @step = Step.new(params[:step])
    if @step.save
      upload = Upload.new
      upload.file = params[:step][:image]
      upload.save
      @title = pat(:create_title, :model => "step #{@step.id}")
      flash[:success] = pat(:create_success, :model => 'Step')
      redirect url(:steps, :new, :id => params[:step][:id] )
      #params[:save_and_continue] ? redirect(url(:steps, :new)) : redirect(url(:steps, :edit))
    else
      @title = pat(:create_title, :model => 'step')
      flash.now[:error] = pat(:create_error, :model => 'step')
      render 'steps/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "step #{params[:id]}")
    @step = Step.find(params[:id])
    if @step
      render 'steps/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'step', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "step #{params[:id]}")
    @step = Step.find(params[:id])
    if @step
      if @step.update_attributes(params[:step])

      upload = Upload.new
      upload.file = params[:step][:image]
      upload.save
        
        flash[:success] = pat(:update_success, :model => 'Step', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:steps, :new)) :
          redirect(url(:steps, :edit, :id => @step.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'step')
        render 'steps/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'step', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Steps"
    step = Step.find(params[:id])
    if step
      if step.destroy
        flash[:success] = pat(:delete_success, :model => 'Step', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'step')
      end
      redirect url(:steps, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'step', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Steps"
    unless params[:step_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'step')
      redirect(url(:steps, :index))
    end
    ids = params[:step_ids].split(',').map(&:strip)
    steps = Step.find(ids)
    
    if Step.destroy steps
    
      flash[:success] = pat(:destroy_many_success, :model => 'Steps', :ids => "#{ids.to_sentence}")
    end
    redirect url(:steps, :index)
  end
end
