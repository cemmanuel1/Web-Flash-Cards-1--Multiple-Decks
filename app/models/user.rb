require 'Digest'

class User < ActiveRecord::Base
  validates :name, :email, :password, presence: true
  validates :email, :format => { :with => /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/, :message => "Invalid Email" }
  validates :email, uniqueness: { message: "Email already taken!"}

  has_many :rounds, dependent: :destroy

  before_save :encrypt_password

  def encrypt_password
    self.password = Digest::SHA1.hexdigest(self.password)
  end

  def self.authenticate(email, password)
    User.where(email: email, password: Digest::SHA1.hexdigest(password)).first
  end

end
