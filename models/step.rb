class Step < ActiveRecord::Base
  belongs_to :recipe
  mount_uploader :image, Uploader

end
