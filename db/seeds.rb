# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "json"
require "open-uri"
puts "Bookclub_members"
puts "---------------------------"
BookclubMember.destroy_all
puts "Destroying all meetings"
puts "---------------------------"
Meeting.destroy_all
puts "Destroying all books"
puts "---------------------------"
Book.destroy_all
puts "Books Destroyed"
puts "---------------------------"
Bookclub.destroy_all

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

  end
end

puts "creating bookclub 1"
file = URI.open("https://api.bookclubs.com/files/club_images/32267/avatar.jpg.200x200_q85_crop.jpg")
bookclub = Bookclub.new(name: "Nasty Women Book Club", description: "We are a feminist book club and read books about strong female leads. The name Nasty Women comes from the 2016 US presidential debate where Donald Trump referred to Hillary Clinton as a Nasty Woman. We love reading all books with a feminist take, and proudly claim Roxane Gay as our Patron Saint.")
bookclub.photo.attach(io: file, filename: "#{bookclub.name}.jpg", content_type: "image/jpg")
bookclub.save!

puts "created bookclub 1"

puts "creating bookclub 2"

file = URI.open("https://api.bookclubs.com/files/club_images/5968920/87363davatar.jpg.200x200_q85_crop.png")
bookclub = Bookclub.new(name: "The Horror Fiction Book Club", description: "The Horror Fiction Book Club (mostly) meets on the final Monday of each month (7-8 pm). Even though we are a library book club, members are not required to live in Prince William County to attend meetings. All you need to do is read the book and click the link to join in the conversation! Those brave enough can join us virtually via Webex.")
bookclub.photo.attach(io: file, filename: "#{bookclub.name}.png", content_type: "image/png")
bookclub.save!

puts "created bookclub 2"

puts "creating bookclub 3"

file = URI.open("https://api.bookclubs.com/files/jbc_form_avatars/1146/63bb9favatar.jpg.200x200_q85_crop.png")
bookclub = Bookclub.new(name: "Manga and Books", description: "Here, we will discuss books, and manga.")
bookclub.photo.attach(io: file, filename: "#{bookclub.name}.png", content_type: "image/png")
bookclub.save!

puts "created bookclub3"

puts "creating bookclub 4"

file = URI.open("https://api.bookclubs.com/files/club_images/5977226/avatar.png.200x200_q85_crop.png")
bookclub = Bookclub.new(name: "Queer Science Fiction and Fantasy", description: "An open social space for reading and discussing queer SFF / speculative fiction, from novels to comics to story collections! Meeting monthly at the Culver Steps.")
bookclub.photo.attach(io: file, filename: "#{bookclub.name}.png", content_type: "image/png")
bookclub.save!

puts "created bookclub 4"

puts "creating bookclub 5"

file = URI.open("https://api.bookclubs.com/files/club_images/5994749/c88bfaavatar.jpg.200x200_q85_crop.png")
bookclub = Bookclub.new(name: "Science, Philosophy and Classical Literature", description: "About Science, Philosophy and Classical Literature")
bookclub.photo.attach(io: file, filename: "#{bookclub.name}.png", content_type: "image/png")
bookclub.save!

puts "created bookclub 5"
