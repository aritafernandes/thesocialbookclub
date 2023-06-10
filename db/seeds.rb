# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "json"
require "open-uri"

puts "Destroying all meetings"
puts "---------------------------"
Meeting.destroy_all
puts "Destroyed all meetings"

puts "Destroying all bookclub members"
puts "---------------------------"
BookclubMember.destroy_all
puts "Destroyed all bookclub members"

puts "Destroying all bookclubs"
puts "---------------------------"
Bookclub.destroy_all
puts "Destroyed all bookclubs"

puts "Destroying all books"
puts "---------------------------"
Book.destroy_all
puts "Destroyed books"

puts "Destroying all users"
puts "---------------------------"
User.destroy_all
puts "Destroyed all users"

authors = [
  "toni+morrison",
  "annie+ernaux",
  "jose+saramago",
  "david+sedaris",
  "joan+didion",
  "rachel+carlson",
  "isabel+figueiredo",
  "conceicao+evaristo",
  "jk+rowling",
  "james+baldwin",
  "samantha+irby",
  "ayad+akhtar",
  "eca+queiroz",
  "ondjaki",
  "rachel+cusk",
  "gisela+casimiro",
  "ocean+vuong",
  "sally+rooney",
  "bruno+vieira+amaral",
  "leila+slimani",
  "george+r+r+martin",
  "edouard+louis",
  "chimamanda+ngozi+adichie",
  "bernardine+evaristo"
]

authors.each do |author|
  url = "https://www.googleapis.com/books/v1/volumes?q=inauthor:#{author}"
  books_serialized = URI.open(url).read
  books = JSON.parse(books_serialized)

  puts "Fetch API"
  puts "---------------------------"
  puts author
  books["items"].each do |book|

  next if book["volumeInfo"]["authors"].nil?

  next if book["volumeInfo"]["imageLinks"].nil?

  title = book["volumeInfo"]["title"]
  author = book["volumeInfo"]["authors"][0]
  description = book["volumeInfo"]["description"]
  image = book["volumeInfo"]["imageLinks"]["thumbnail"]
  year = book["volumeInfo"]["publishedDate"].first(4)
  Book.create!(title: title, author: author, description: description, image_link:image, year: year)

  puts "Created book"
  puts "---------------------------"

  end
end

puts "Creating bookclub 1"
puts "---------------------------"
file = URI.open("https://api.bookclubs.com/files/club_images/32267/avatar.jpg.200x200_q85_crop.jpg")
bookclub1 = Bookclub.new(name: "Nasty Women Book Club", description: "We are a feminist book club and read books about strong female leads. The name Nasty Women comes from the 2016 US presidential debate where Donald Trump referred to Hillary Clinton as a Nasty Woman. We love reading all books with a feminist take, and proudly claim Roxane Gay as our Patron Saint.")
bookclub1.photo.attach(io: file, filename: "#{bookclub1.name}.jpg", content_type: "image/jpg")
bookclub1.save!

puts "Created bookclub 1"
puts "---------------------------"

puts "Creating bookclub 2"
puts "---------------------------"

file = URI.open("https://api.bookclubs.com/files/club_images/5968920/87363davatar.jpg.200x200_q85_crop.png")
bookclub2 = Bookclub.new(name: "The Horror Fiction Book Club", description: "The Horror Fiction Book Club (mostly) meets on the final Monday of each month (7-8 pm). Even though we are a library book club, members are not required to live in Prince William County to attend meetings. All you need to do is read the book and click the link to join in the conversation! Those brave enough can join us virtually via Webex.")
bookclub2.photo.attach(io: file, filename: "#{bookclub2.name}.png", content_type: "image/png")
bookclub2.save!

puts "Created bookclub 2"
puts "---------------------------"

puts "Creating bookclub 3"
puts "---------------------------"

file = URI.open("https://api.bookclubs.com/files/club_images/5968894/avatar_p3ojgty.png.200x200_q85_crop.png")
bookclub3 = Bookclub.new(name: "The Reading Corner", description: "The Reading Corner Book Club is an extension of our publishing platform thereadingcorner.art. At TRC, we aim to diversify people's shelves by championing underrepresented authors, diversifying people's shelves and rebuilding the industry page by page.")
bookclub3.photo.attach(io: file, filename: "#{bookclub3.name}.png", content_type: "image/png")
bookclub3.save!

puts "Created bookclub3"
puts "---------------------------"

puts "Creating bookclub 4"
puts "---------------------------"

file = URI.open("https://api.bookclubs.com/files/club_images/5977226/avatar.png.200x200_q85_crop.png")
bookclub4 = Bookclub.new(name: "Queer Science Fiction and Fantasy", description: "An open social space for reading and discussing queer SFF / speculative fiction, from novels to comics to story collections! Meeting monthly at the Culver Steps.")
bookclub4.photo.attach(io: file, filename: "#{bookclub4.name}.png", content_type: "image/png")
bookclub4.save!

puts "Created bookclub 4"
puts "---------------------------"

puts "Creating bookclub 5"
puts "---------------------------"

file = URI.open("https://api.bookclubs.com/files/club_images/5994749/c88bfaavatar.jpg.200x200_q85_crop.png")
bookclub5 = Bookclub.new(name: "Science, Philosophy and Classical Literature", description: "About Science, Philosophy and Classical Literature")
bookclub5.photo.attach(io: file, filename: "#{bookclub5.name}.png", content_type: "image/png")
bookclub5.save!

puts "Created bookclub 5"
puts "---------------------------"

puts "Create user"
puts "---------------------------"

user1 = User.create(email: "rita@admin.com", password: "123123")
user2 = User.create(email: "thamara@admin.com", password: "123123")
user3 = User.create(email: "gabriel@admin.com", password: "123123")

puts "Created user"
puts "---------------------------"

puts "Create bookclub members for club 1"
puts "---------------------------"

bookclubmember1 = BookclubMember.create(user: user1, bookclub: bookclub1, admin: true)
bookclubmember2 = BookclubMember.create(user: user2, bookclub: bookclub1)
bookclubmember3 = BookclubMember.create(user: user3, bookclub: bookclub1)

puts "Created bookclub members for club 1"
puts "---------------------------"


puts "Create bookclub members for club 2"
puts "---------------------------"

bookclubmember1 = BookclubMember.create(user: user1, bookclub: bookclub2)
# bookclubmember2 = BookclubMember.create(user: user2, bookclub: bookclub2, admin: true )
bookclubmember3 = BookclubMember.create(user: user3, bookclub: bookclub2)

puts "Created bookclub members for club 2"
puts "---------------------------"

puts "Create bookclub members for club 3"
puts "---------------------------"

bookclubmember1 = BookclubMember.create(user: user1, bookclub: bookclub3)
bookclubmember2 = BookclubMember.create(user: user2, bookclub: bookclub3, admin: true )
bookclubmember3 = BookclubMember.create(user: user3, bookclub: bookclub3)

puts "Created bookclub members for club 3"
puts "---------------------------"

puts "Create bookclub members for club 4"
puts "---------------------------"

bookclubmember1 = BookclubMember.create(user: user1, bookclub: bookclub4)
bookclubmember2 = BookclubMember.create(user: user2, bookclub: bookclub4, admin: true )
bookclubmember3 = BookclubMember.create(user: user3, bookclub: bookclub4)

puts "Created bookclub members club 4"
puts "---------------------------"


puts "Create bookclub members for club 5"
puts "---------------------------"

bookclubmember1 = BookclubMember.create(user: user1, bookclub: bookclub5)
bookclubmember2 = BookclubMember.create(user: user2, bookclub: bookclub5, admin: true)
bookclubmember3 = BookclubMember.create(user: user3, bookclub: bookclub5)

puts "Created bookclub members club 5"
puts "---------------------------"

puts "Create user 1 photo"
puts "---------------------------"

file = URI.open("https://images.gr-assets.com/users/1641123162p8/145281070.jpg")
user1.photo.attach(io: file, filename: "#{user1.photo}.jpg", content_type: "image/jpg")
user1.save!

puts "Created user1 photo"
puts "---------------------------"

puts "Create user 2 photo"
puts "---------------------------"

file = URI.open("https://avatars.githubusercontent.com/u/130979836?v=4")
user2.photo.attach(io: file, filename: "#{user2.photo}.jpg", content_type: "image/jpg")
user2.save!

puts "Created user 2 photo"
puts "---------------------------"

puts "Create user 3 photo"
puts "---------------------------"

file = URI.open("https://avatars.githubusercontent.com/u/127883142?v=4")
user3.photo.attach(io: file, filename: "#{user3.photo}.jpg", content_type: "image/jpg")
user3.save!

puts "Created user 3 photo"
puts "---------------------------"


puts "Create meeting"
puts "---------------------------"

meeting1 = Meeting.create(bookclub: bookclub1, book: Book.all.sample, location: "Rua do Conde de Redondo 91B, 1150-103, Lisboa", date_time: DateTime.new(2023,6,9,5,0,0) )
meeting2 = Meeting.create(bookclub: bookclub2, book: Book.all.sample, location: "https://us06web.zoom.us/j/84145373454?pwd=WHNCNmdDM1lTdDJEcW03R004ZExpQT09", date_time: DateTime.new(2023,6,12,6,0,0) )
meeting3 = Meeting.create(bookclub: bookclub3, book: Book.all.sample, location: "Avenida Padre Manuel da Nóbrega, 9, 1000-223, Areeiro", date_time: DateTime.new(2023,8,10,6,0,0) )
meeting4 = Meeting.create(bookclub: bookclub4, book: Book.all.sample, location: "Rua Sousa Viterbo, 32, 1900-427, Penha de França", date_time: DateTime.new(2023,8,10,6,0,0) )
meeting5 = Meeting.create(bookclub: bookclub5, book: Book.all.sample, location: "Avenida das Tílias, 5, 2635-546, Rio de Mouro", date_time: DateTime.new(2023,8,10,6,0,0) )


puts "Created meeting"
puts "---------------------------"
