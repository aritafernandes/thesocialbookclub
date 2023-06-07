class BookclubsController < ApplicationController
  before_action :set_bookclub, only: %i[show destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @bookclubs = policy_scope(Bookclub.all)
  end

  def show
    authorize @bookclub
  end

  def new
    @bookclub = Bookclub.new
  end

  def create
    @bookclub = Bookclub.new(bookclub_params)

    if @bookclub.save
      redirect_to bookclubs_path
    else
      render :new, status: :unprocessable_entity
    end
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
