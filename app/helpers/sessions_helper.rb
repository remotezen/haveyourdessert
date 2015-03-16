# Helper methods defined here can be accessed in any controller or view in the application

module Blog
  class App
    module SessionsHelper
      # def simple_helper_method
      # ...
      # end
      def current_user
        @current_user ||=
        User.find(session[:user_id]) if session[:user_id]
      end
      
      def current_user?(user)
        current_user == user
      end
      

     
      def logged_in?
        !current_user.nil?
      end
      
      def log_out
        session[:user_id] = nil
        session[:since] = nil
      end
      
      def log_in(user)
        session[:user_id] = user.id
        session[:since] = Time.now.to_s
        
      end
      def current_user_id
        session[:user_id]
      end
      def since
        session[:since].to_s
      end

      def is_admin?(user)
        if logged_in?
        id = session[:user_id]
        @user = User.find(id) and (current_user = user)
        @user.admin == true
        else
          false
        end
      end
      
      def correct_user
        user = User.find(session[:user_id])
        unless user == current_user 
          redirect_to('/')
        end
      end

    end

    helpers SessionsHelper
  end
end
