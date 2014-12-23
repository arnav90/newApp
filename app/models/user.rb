class User < ActiveRecord::Base
  validates_presence_of :email, :password
  validates_uniqueness_of :email
  validates_length_of :password, in: 4..20

  before_save :encrypt_password

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password == BCrypt::Engine.hash_secret(password,user.salt)
      return user
    end
  end

  def encrypt_password
    self.salt = BCrypt::Engine.generate_salt
    self.password = BCrypt::Engine.hash_secret(password, salt)
  end
end