# Helper methods defined here can be accessed in any controller or view in the application

module Blog
  class App
    module UsersHelper

  def gravatar_for(user, options = {size:80})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}?d=identicon"
    image_tag(url,  class: "gravatar")
  end
      # def simple_helper_method
      # ...
      # end
  #
 def  sym_to(sym)
   sym.to_s.gsub("_", " ")
 end
    end

    helpers UsersHelper
  end

end
