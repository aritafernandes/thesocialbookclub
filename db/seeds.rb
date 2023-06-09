# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "json"
require "open-uri"

puts "Destroying all Bookclub_members"
puts "---------------------------"
BookclubMember.destroy_all
puts "Destroying all meetings"
puts "---------------------------"
Meeting.destroy_all
puts "Destroying all books"
puts "---------------------------"
Book.destroy_all
puts "Destroying all bookclubs"
puts "---------------------------"
Bookclub.destroy_all
puts "Destroying all users"
puts "---------------------------"
User.destroy_all


authors = ["toni+morrison", "annie+ernaux", "jose+saramago", "david+sedaris"]

authors.each do |author|
  url = "https://www.googleapis.com/books/v1/volumes?q=inauthor:#{author}&langRestrict=en"
  books_serialized = URI.open(url).read
  books = JSON.parse(books_serialized)

  puts "fetch na api"
  puts "---------------------------"
  books["items"].each do |book|

  next if book["volumeInfo"]["authors"].nil?

  next if book["volumeInfo"]["imageLinks"].nil?

  title = book["volumeInfo"]["title"]
  author = book["volumeInfo"]["authors"][0]
  description = book["volumeInfo"]["description"]
  image = book["volumeInfo"]["imageLinks"]["thumbnail"]
  year = book["volumeInfo"]["publishedDate"].first(4)
  Book.create!(title: title, author: author, description: description, image_link:image, year: year)

  puts "created book"
  puts "---------------------------"

  end
end

puts "creating bookclub 1"
puts "---------------------------"
file = URI.open("https://api.bookclubs.com/files/club_images/32267/avatar.jpg.200x200_q85_crop.jpg")
bookclub1 = Bookclub.new(name: "Nasty Women Book Club", description: "We are a feminist book club and read books about strong female leads. The name Nasty Women comes from the 2016 US presidential debate where Donald Trump referred to Hillary Clinton as a Nasty Woman. We love reading all books with a feminist take, and proudly claim Roxane Gay as our Patron Saint.")
bookclub1.photo.attach(io: file, filename: "#{bookclub1.name}.jpg", content_type: "image/jpg")
bookclub1.save!

puts "created bookclub 1"
puts "---------------------------"

puts "creating bookclub 2"
puts "---------------------------"

file = URI.open("https://api.bookclubs.com/files/club_images/5968920/87363davatar.jpg.200x200_q85_crop.png")
bookclub2 = Bookclub.new(name: "The Horror Fiction Book Club", description: "The Horror Fiction Book Club (mostly) meets on the final Monday of each month (7-8 pm). Even though we are a library book club, members are not required to live in Prince William County to attend meetings. All you need to do is read the book and click the link to join in the conversation! Those brave enough can join us virtually via Webex.")
bookclub2.photo.attach(io: file, filename: "#{bookclub2.name}.png", content_type: "image/png")
bookclub2.save!

puts "created bookclub 2"
puts "---------------------------"

puts "creating bookclub 3"
puts "---------------------------"

file = URI.open("https://api.bookclubs.com/files/jbc_form_avatars/1146/63bb9favatar.jpg.200x200_q85_crop.png")
bookclub3 = Bookclub.new(name: "Manga and Books", description: "Here, we will discuss books, and manga.")
bookclub3.photo.attach(io: file, filename: "#{bookclub3.name}.png", content_type: "image/png")
bookclub3.save!

puts "created bookclub3"
puts "---------------------------"

puts "creating bookclub 4"
puts "---------------------------"

file = URI.open("https://api.bookclubs.com/files/club_images/5977226/avatar.png.200x200_q85_crop.png")
bookclub4 = Bookclub.new(name: "Queer Science Fiction and Fantasy", description: "An open social space for reading and discussing queer SFF / speculative fiction, from novels to comics to story collections! Meeting monthly at the Culver Steps.")
bookclub4.photo.attach(io: file, filename: "#{bookclub4.name}.png", content_type: "image/png")
bookclub4.save!

puts "created bookclub 4"
puts "---------------------------"

puts "creating bookclub 5"
puts "---------------------------"

file = URI.open("https://api.bookclubs.com/files/club_images/5994749/c88bfaavatar.jpg.200x200_q85_crop.png")
bookclub5 = Bookclub.new(name: "Science, Philosophy and Classical Literature", description: "About Science, Philosophy and Classical Literature")
bookclub5.photo.attach(io: file, filename: "#{bookclub5.name}.png", content_type: "image/png")
bookclub5.save!

puts "created bookclub 5"
puts "---------------------------"

puts "create user admins"
puts "---------------------------"

user1 = User.create(email: "rita@admin.com", password: "123123")
user2 = User.create(email: "thamara@admin.com", password: "123123")
user3 = User.create(email: "gabriel@admin.com", password: "123123")

puts "created user admins"
puts "---------------------------"

puts "create bookclub members for club 1"
puts "---------------------------"

bookclubmember1 = BookclubMember.create(user: user1, bookclub: bookclub1, admin: true)
bookclubmember2 = BookclubMember.create(user: user2, bookclub: bookclub1)
bookclubmember3 = BookclubMember.create(user: user3, bookclub: bookclub1)

puts "created bookclub members 1"
puts "---------------------------"


puts "create bookclub members for club 2"
puts "---------------------------"

bookclubmember1 = BookclubMember.create(user: user1, bookclub: bookclub2)
bookclubmember2 = BookclubMember.create(user: user2, bookclub: bookclub2, admin: true )
bookclubmember3 = BookclubMember.create(user: user3, bookclub: bookclub2)

puts "created bookclub members 2"
puts "---------------------------"

puts "create bookclub members for club 3"
puts "---------------------------"

bookclubmember1 = BookclubMember.create(user: user1, bookclub: bookclub3)
bookclubmember2 = BookclubMember.create(user: user2, bookclub: bookclub3, admin: true )
bookclubmember3 = BookclubMember.create(user: user3, bookclub: bookclub3)

puts "created bookclub members 3"
puts "---------------------------"

puts "create bookclub members for club 4"
puts "---------------------------"

bookclubmember1 = BookclubMember.create(user: user1, bookclub: bookclub4)
bookclubmember2 = BookclubMember.create(user: user2, bookclub: bookclub4, admin: true )
bookclubmember3 = BookclubMember.create(user: user3, bookclub: bookclub4)

puts "created bookclub members 4"
puts "---------------------------"


puts "create bookclub members for club 5"
puts "---------------------------"

bookclubmember1 = BookclubMember.create(user: user1, bookclub: bookclub4)
bookclubmember2 = BookclubMember.create(user: user2, bookclub: bookclub4, admin: true )
bookclubmember3 = BookclubMember.create(user: user3, bookclub: bookclub4)

puts "created bookclub members 5"
puts "---------------------------"


puts "create user1 photo"
puts "---------------------------"

file = URI.open("https://images.gr-assets.com/users/1641123162p8/145281070.jpg")
user1.photo.attach(io: file, filename: "#{user1.photo}.jpg", content_type: "image/jpg")
user1.save!

puts "created user1 photo"
puts "---------------------------"
