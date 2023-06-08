class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookclub_members
  has_many :bookclubs, through: :bookclub_members
  has_many :my_books
  has_many :books, through: :my_books
  has_one_attached :photo

end
