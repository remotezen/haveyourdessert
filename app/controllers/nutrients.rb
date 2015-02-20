Blog::App.controllers :nutrients do
   get :index, map: '/food' do
     @food = Nutrient.all
     render :index
   end
end
