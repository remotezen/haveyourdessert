class Post < ActiveRecord::Base
  has_many :comments
  has_many :sessions
  has_permalink :title
  mount_uploader :image, Uploader

end
