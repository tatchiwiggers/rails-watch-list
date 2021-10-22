# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Movie.create!(
#               title: "Wonder Woman 1984",
#               overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s",
#               poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg",
#               rating: 6.9
#             )

# Movie.create!(
#               title: "The Shawshank Redemption",
#               overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison",
#               poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg"
#               rating: 8.7
#             )

# Movie.create!(
#               title: "Titanic",
#               overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.",
#               poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg",
#               rating: 7.9
#             )

# Movie.create!(
#               title: "Ocean's Eight",
#               overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.",
#               poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg",
#               rating: 7.0
#             )

require 'open-uri'
require 'json'

puts "Cleaning up database..."
Movie.destroy_all
puts "Database cleaned"

# https://tmdb.lewagon.com/movie/top_rated?page=2

# iterates over the movies pages and fetches all movies from that page
url = "http://tmdb.lewagon.com/movie/top_rated"
10.times do |i|
  puts "Importing movies from page #{i + 1}"
  # movies is a list => results
  movies = JSON.parse(open("#{url}?page=#{i + 1}").read)['results']
  
  # creates movie objects fetched from url pages
  movies.each do |movie|
    puts "Creating #{movie['title']}"
    base_poster_url = "https://image.tmdb.org/t/p/original"

    Movie.create(
      title: movie['title'],
      overview: movie['overview'],
      # https://image.tmdb.org/t/p/original/9guoVF7zayiiUq5ulKQpt375VIy.jpg
      poster_url: "#{base_poster_url}#{movie['backdrop_path']}",
      rating: movie['vote_average']
    )
  end
end
puts "Movies created"