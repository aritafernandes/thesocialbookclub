class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home index show]

  def home
    @bookclubs = Bookclub.where.associated(:books).first(3)
  end
end
