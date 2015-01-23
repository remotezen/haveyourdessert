class Post < ActiveRecord::Base
  mount_uploader :image, Uploader
end
