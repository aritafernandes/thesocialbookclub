class Meeting < ApplicationRecord
  belongs_to :bookclub
  has_many :meeting_guests
  belongs_to :book

  enum status: { pending: 0, accepted: 1, declined: 2 }

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
