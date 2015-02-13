class Recipe < ActiveRecord::Base
  has_many :steps
  mount_uploader :image, Uploader

end
