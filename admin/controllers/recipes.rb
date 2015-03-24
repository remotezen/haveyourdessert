Blog::Admin.controllers :recipes do
  get :index do
    @title = "Recipes"
    @page_title = " Your Recipes"
    @recipes = Recipe.all
    render 'recipes/index'
  end
  
  get :show, :with => :id  do
   @recipe = Recipe.find(params[:id])
   if @recipe
     @page_title = @recipe.title
     render 'recipes/show'
   else
     halt 404
   end
  end

  get :new, :with => '(:id)'  do
    
    @title = "Create a Recipe"
    @page_title = "Create a recipe"
    @id = params[:id]
    @recipe = Recipe.new
    render 'recipes/new'
  end

  post :create  do
    @post = Post.find_by_id(params[:recipe][:post_id])
    @recipe = @post.recipes.build(params[:recipe])
    
    if @recipe.save
      hash = { recipe_id: @recipe.id }
      @post.update_attributes(hash)
      upload = Upload.new
      upload.file = params[:recipe][:image]
      upload.save
      @title = pat(:create_title, :model => "recipe #{@recipe.id}")
      flash[:success] = pat(:create_success, :model => 'Recipe')
      params[:save_and_continue] ? redirect(url(:steps, :new)) : redirect(url(:recipes, :edit, :id => @recipe.id))
    else
      @title = pat(:create_title, :model => 'recipe')
      flash.now[:error] = pat(:create_error, :model => 'recipe')
      render 'recipes/new'
    end
  end

  get :edit, :with => :id do
    @page_title = "edit your recipe"
    @title = pat(:edit_title, :model => "recipe #{params[:id]}")
    @recipe = Recipe.find(params[:id])
    if @recipe
      render 'recipes/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'recipe', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "recipe #{params[:id]}")
    @recipe = Recipe.find(params[:id])
    if @recipe
      if @recipe.update_attributes(params[:recipe])
        upload = Upload.new
        upload.file = params[:recipe][:image]
        upload.save
        flash[:success] = pat(:update_success, :model => 'Recipe', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:recipes, :index)) :
          redirect(url(:recipes, :edit, :id => @recipe.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'recipe')
        render 'recipes/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'recipe', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Recipes"
    recipe = Recipe.find(params[:id])
    if recipe
      if recipe.destroy
        flash[:success] = pat(:delete_success, :model => 'Recipe', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'recipe')
      end
      redirect url(:recipes, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'recipe', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Recipes"
    unless params[:recipe_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'recipe')
      redirect(url(:recipes, :index))
    end
    ids = params[:recipe_ids].split(',').map(&:strip)
    recipes = Recipe.find(ids)
    
    if Recipe.destroy recipes
    
      flash[:success] = pat(:destroy_many_success, :model => 'Recipes', :ids => "#{ids.to_sentence}")
    end
    redirect url(:recipes, :index)
  end
end
