class User < ActiveRecord::Base
  has_secure_password
  has_many :selections, dependent: :destroy
  has_many :songs, through: :selections
  validates :first_name, :last_name, presence:true, length:{ minimum:2 }
  validates :email, presence:true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, uniqueness: { case_sensitive:false }
end
