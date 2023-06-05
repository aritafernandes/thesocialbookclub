class Book < ApplicationRecord
  has_many :my_books
  has_many :users, through: :my_books
end
