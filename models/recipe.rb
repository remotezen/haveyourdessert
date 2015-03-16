class Recipe < ActiveRecord::Base
  include PgSearch
  has_many :steps
  has_permalink :title
  mount_uploader :image, Uploader
  has_one:post

end
