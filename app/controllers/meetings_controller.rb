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
    @meeting = Meeting.find(params[:meeting_id])
    authorize @meeting
    @meeting.accepted!
    redirect_to bookclub_path(@meeting.bookclub), status: :see_other
  end

  def decline
    @meeting = Meeting.find(params[:meeting_id])
    authorize @meeting
    @meeting.declined!
    redirect_to bookclub_path(@meeting.bookclub), status: :see_other
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
