# Helper methods defined here can be accessed in any controller or view in the application

module Blog
  class App
    module PostsHelper
  def is_pjax?
      #  headers['X-PJAX']
      env['HTTP_X_PJAX']
    end
      def title(title = nil)
        unless title.blank?
          real_title =
          "Have Your Dessert | #{title }"  
        else
          real_title = "Have Your Dessert"
        end
      end
      
      def link_razor(obj)
        if obj.class == Post
          link_to(obj.title, url_for(:posts,:show, id: obj.permalink))
        elsif obj.class  == Recipe
          link_to(obj.title, url_for(:recipes,:show, id: obj.permalink))
        end
      end


      def image_cycle(* args)

        @_image_cycle ||= reset_image(args)
        @_image_cycle = [@_image_cycle.pop] + @_image_cycle
        @_image_cycle.first
      end
    
      def cycle
      @_cycle ||= reset_cycle
      @_cycle = [@_cycle.pop] + @_cycle
      @_cycle.first
    end
      def bicycle
      @_cycle ||= reset_bicycle
      @_cycle = [@_cycle.pop] + @_cycle
      @_cycle.first
    end
    
    def reset_image(args)
      args.reverse.each do |i|
      @_image_cycle = [i] 
      end
    end
    
    def reset_cycle
    @_cycle = %w(even odd)
    end
    def reset_bicycle
    @_cycle = %w(step-odd step-even step-outside)
    end
    # def simple_helper_method
    # end
    def post_date(post)
      raw = post.created_at
      date = raw.to_s.split('-')
      day_month = date[2].split(' ')
      month = return_month(date[1])
      hash = { :day => day_month[0],
      :month => month,
      :year => date[0]
      }
      main = {
      :blog_date => hash,
      :time_ago => " posted #{time_ago_in_words(raw)} ago"
      }
      partial 'shared/calendar', :locals => { :h => main}
      end
      def return_month(mon)
      month = case mon.to_i
      when 1 then "January"
      when 2 then " Feburary"
      when 3 then "March"
      when 4 then "April"
      when 5 then "May"
      when 6 then "June"
      when 7 then "July"
      when 8 then "August"
      when 9 then "September"
      when 10 then "October"
      when 11 then "Novemeber"
      when 12 then "December"
      else "no such month"
      end
    return month
    end
          # def simple_helper_method
      # ...
      # end
    end

    helpers PostsHelper
  end
end
