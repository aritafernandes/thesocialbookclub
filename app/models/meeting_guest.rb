class MeetingGuest < ApplicationRecord
  belongs_to :user
  belongs_to :meeting

  enum :status, { pending: 0, accepted: 1, declined: 2 }
end
