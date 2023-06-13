class MeetingsController < ApplicationController

  def new
    @bookclub = Bookclub.find(params[:bookclub_id])
    authorize @bookclub
    @meeting = Meeting.new(bookclub: @bookclub)
    authorize @meeting
    @meeting.bookclub = @bookclub
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.bookclub = Bookclub.find(params[:bookclub_id])
    @meeting.status = :pending
    if @meeting.save
      authorize @meeting
      redirect_to bookclub_path(@meeting.bookclub)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def accept
    # create meeting guest and change status to "accept"
    @meeting_guest = MeetingGuest.create(meeting_id:params[:meeting_id], user_id: current_user.id)
    authorize @meeting_guest.meeting
    @meeting_guest.accepted!
    redirect_to bookclub_path(@meeting_guest.meeting.bookclub), status: :see_other
  end

  def decline
    # create meeting guest and change status to "decline"
    @meeting_guest = MeetingGuest.create(meeting_id:params[:meeting_id], user_id: current_user.id)
    authorize @meeting_guest.meeting
    @meeting_guest.declined!
    redirect_to bookclub_path(@meeting_guest.meeting.bookclub), status: :see_other
  end

  def show
    @meeting = Meeting.find(params[:id])
    authorize @meeting
  end

  private

  def meeting_params
    params.require(:meeting).permit(:book_id, :date_time, :video_link, :location)
  end
end
