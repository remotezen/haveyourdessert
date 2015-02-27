class Post < ActiveRecord::Base
  has_many :comments
  has_many :sessions
  has_one:recipe
  has_permalink :title
  mount_uploader :image, Uploader

end
