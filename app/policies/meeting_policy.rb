class MeetingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def new?
    return false if @user.nil?
    member = @record.bookclub.bookclub_members.find_by(user_id: @user.id)
    member.nil? ? false : member.admin?
  end

  def create?
    return false if @user.nil?
    member = @record.bookclub.bookclub_members.find_by(user_id: @user.id)
    member.nil? ? false : member.admin?
  end

  def show?
    return false if @user.nil?
    member = @record.bookclub.bookclub_members.find_by(user_id: @user.id)
    !member.nil?
  end

  def accept?
    true
  end

  def decline?
    true
  end
end
