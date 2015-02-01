# Helper methods defined here can be accessed in any controller or view in the application

module Blog
  class App
    module PostsHelper
      def title(title = nil)
        unless title.blank?
          real_title =
          "Tuning in | #{title }"  
        else
          real_title = "Tuning in and having the time of your life"
        end

          
          
      end
      # def simple_helper_method
      # ...
      # end
    end

    helpers PostsHelper
  end
end
