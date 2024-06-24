class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts
  # validates :username, presence: true, length: {minimum: 3}
  validates :email, presence: true, format: {with: /\A[A-Za-z0-9.]{3,10}@[a-z]{3,10}\.[a-z]{2,4}\z/, message: " must be in correct Format"}
  validates :password, presence: true,length: {minimum:8} , format: {with: /\A(?=.*[a-z])(?=.*\d)(?=.*[A-Z])(?=.*[!@#$%^&*]).{8,10}\z/, message: " must have one lowercase, uppercase, special character and digit 8 to 10 character long."}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
