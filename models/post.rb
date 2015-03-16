class Post < ActiveRecord::Base
  include PgSearch
  has_many :comments
  has_many :sessions
  has_many :recipes
  has_permalink :title
  mount_uploader :image, Uploader
  validates :image, presence:true
  validates :title, presence:true,
    length: { maximum:140} 
  validates :body, presence: true

end
