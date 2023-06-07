class MeetingsController < ApplicationController

  def new
    @meeting = Meeting.new
    @bookclub = Bookclub.find(params[:bookclub_id])
  end

  def create
  end

  def show
  end

end
