Blog::App.controllers :steps do
  get :index, with: :id, provides: :js do
    @steps = Step.where(:recipe_id == params[:id])
    render 'steps/index', layout: !is_pjax?
      
  end
end
