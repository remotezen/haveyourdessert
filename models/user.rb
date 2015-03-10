class User < ActiveRecord::Base
  attr_accessor :password
   EMAIL_REGEX = /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i
  before_save :encrypt_password
  validates_confirmation_of :password
  validates_presence_of :password
  validates_presence_of :email, 
    uniqueness: { case_sensitive:false },
    format: { with: EMAIL_REGEX }
  validates_confirmation_of :email
  has_many :comments
  has_many :recipes


  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == 
        BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
    private
    def encrypt_password
      if password.present?
       self.password_salt = BCrypt::Engine.generate_salt
       self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
      end
    end
  end
