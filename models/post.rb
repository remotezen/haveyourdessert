class Post < ActiveRecord::Base
  has_permalink :title
  mount_uploader :image, Uploader

end
