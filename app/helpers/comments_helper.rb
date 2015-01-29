# Helper methods defined here can be accessed in any controller or view in the application

module Blog
  class App
    module CommentsHelper
      
      def is_pjax?
        env['HTTP_X_PJAX']
      end
      # def simple_helper_method
      # ...
      # end
    end

    helpers CommentsHelper
  end
end
