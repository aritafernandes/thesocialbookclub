class Bookclub < ApplicationRecord
  has_many :meetings
  has_many :bookclub_members
  has_many :books, through: :meetings
  has_one_attached :photo
end
