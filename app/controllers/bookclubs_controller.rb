class BookclubsController < ApplicationController
  before_action :set_bookclub, only: %i[show destroy join]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @bookclubs = policy_scope(Bookclub.all)
  end

  def show
    authorize @bookclub
    #@current_meeting = @bookclub.meetings.first_or_create(book: Book.all.sample, location: "Hard Rock", bookclub: @bookclub)

    @current_meeting = @bookclub.meetings.last
    @book = @current_meeting.book if @bookclub.meetings.present?
    @is_bookclub_member = @bookclub.bookclub_members.where(user: current_user).empty?
  end

  def new
    @bookclub = Bookclub.new
    authorize @bookclub
  end

  def create
    @bookclub = Bookclub.new(bookclub_params)

    if @bookclub.save
      authorize @bookclub
      BookclubMember.create(user: current_user, bookclub: @bookclub, admin: true)
      redirect_to bookclubs_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def join
    authorize @bookclub
    BookclubMember.find_or_create_by(user: current_user, bookclub: @bookclub, admin: false)
    redirect_to bookclub_path(@bookclub)
  end

  def destroy
    @bookclub.destroy
    redirect_to bookclubs_path, status: :see_other
  end

  private

  def set_bookclub
    @bookclub = Bookclub.find(params[:id])
  end

  def bookclub_params
    params.require(:bookclub).permit(:name, :genre, :description, :photo)
  end
end
