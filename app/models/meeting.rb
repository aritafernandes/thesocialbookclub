class Meeting < ApplicationRecord
  belongs_to :bookclub
  has_many :meeting_guests
  belongs_to :book
end
