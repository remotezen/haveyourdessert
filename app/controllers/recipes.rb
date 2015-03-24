
Blog::App.controllers :recipes do
  get :show, :with => :id do
    @recipe  = Recipe.find_by_permalink(params[:id])
    render 'recipes/show' 
  end
end
