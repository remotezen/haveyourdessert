class Recipe < ActiveRecord::Base
  has_many :steps
  mount_uploader :image, Uploader
  has_one:post

end
