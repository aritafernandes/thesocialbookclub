class BookclubsController < ApplicationController

  def new
    @bookclub = Bookclub.new
  end

  def create
    # @bookclub = Bookclub.new(bookclub_params)

  end

  def destroy
  end


  private

  def bookclub_params
    params.require(:bookclub).permit(:name, :genre)
  end

end
