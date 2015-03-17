Blog::App.controllers :steps do
  get :index, with: :id, provides: :js do
    @steps = Step.where(:recipe_id == params[:id])
    "$('#steps-content').html('#{partial("steps/index")}');"
      
  end
end
