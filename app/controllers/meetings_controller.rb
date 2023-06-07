class MeetingsController < ApplicationController

  def new
    @meeting = Meeting.new
    @bookclub = Bookclub.find(params[:bookclub_id])
    @meeting.bookclub = @bookclub
    authorize @meeting
    authorize @bookclub
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.bookclub = Bookclub.find(params[:bookclub_id])
    if @meeting.save
      authorize @meeting
      redirect_to bookclub_meeting_path(@meeting.bookclub, @meeting)
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
