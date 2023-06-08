class Meeting < ApplicationRecord
  belongs_to :bookclub
  has_many :meeting_guests
  belongs_to :book

  enum status: { pending: 0, accepted: 1, declined: 2 }
end
