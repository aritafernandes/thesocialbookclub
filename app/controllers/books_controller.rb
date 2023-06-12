class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @books = policy_scope(Book)

    if params[:query].present?
      sql_subquery = "title ILIKE :query OR author ILIKE :query"
      @books = @books.where(sql_subquery, query: "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html
      format.text { render partial: "books/list", locals: { books: @books }, formats: [:html] }
    end
  end

  def show
    @book = Book.find(params[:id])
    authorize @book
  end
end
