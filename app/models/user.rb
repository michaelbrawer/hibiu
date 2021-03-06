class User < ApplicationRecord
  has_secure_password

  # Verify that an email exists and that it does not already exist in the db
  validates :email, presence: true, uniqueness: true
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
