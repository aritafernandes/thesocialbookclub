class MeetingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def new?
    member = @record.bookclub.bookclub_members.find_by(user_id: @user.id)
    member.nil? ? false : member.admin?
  end

  def create?
    member = @record.bookclub.bookclub_members.find_by(user_id: @user.id)
    member.nil? ? false : member.admin?
  end

  def show?
    member = @record.bookclub.bookclub_members.find_by(user_id: @user.id)
    !member.nil?
  end
end
