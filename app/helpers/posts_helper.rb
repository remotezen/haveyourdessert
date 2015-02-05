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
    def cycle
      @_cycle ||= reset_cycle
      @_cycle = [@_cycle.pop] + @_cycle
      @_cycle.first
    end
    def reset_cycle
    @_cycle = %w(even odd)
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
