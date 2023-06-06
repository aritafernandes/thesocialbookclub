class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @bookclubs = Bookclub.all.first(3)
  end
end
