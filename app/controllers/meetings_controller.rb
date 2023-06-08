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
    if @meeting.save
      authorize @meeting
      redirect_to bookclub_path(@meeting.bookclub)
    else
      render :new, status: :unprocessable_entity
    end
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
