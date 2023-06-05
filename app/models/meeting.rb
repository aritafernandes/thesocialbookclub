class Meeting < ApplicationRecord
  belongs_to :bookclub
  has_many :meeting_guests
  has_one :book
end
