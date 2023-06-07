class BookclubMember < ApplicationRecord
  belongs_to :user
  belongs_to :bookclub

  def admin?
    admin
  end
end
