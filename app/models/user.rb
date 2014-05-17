require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  
  validates :email_address, presence: true, uniqueness: true
  validates :password, presence: true
  validates :user_password, confirmation: true
  
  attr_reader :user_password
  def user_password=(new_password)
    @user_password = new_password
    self.password = User.encrypt_password @user_password
  end
  
  def self.encrypt_password( unencrypted_pass )
    Password.create unencrypted_pass
  end
  
  def self.authenticate( email, password )
    usr = User.find_by_email_address email
    if usr
      if Password.new(usr.password) == password
        usr
      end
    end
  end
  
end
