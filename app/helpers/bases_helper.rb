# Helper methods defined here can be accessed in any controller or view in the application

module Blog
  class App
    module BasesHelper
      def time_split(time)
        arr = time.to_s.split(/ /)
        arr[0].gsub('-', ' ')
      end
      # def simple_helper_method
      # ...
      # end
    end

    helpers BasesHelper
  end
end
