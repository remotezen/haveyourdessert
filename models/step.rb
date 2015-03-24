class Step < ActiveRecord::Base
  belongs_to :recipe
  mount_uploader :image, Uploader
  validates :step, presence: true 
  validates :title, presence: true


end
