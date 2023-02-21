require_relative 'Book'
require_relative 'MusicAlbum'
require_relative 'Movie'
require_relative 'Game'
# require 'json'

def list_all_books(books)
  if books.empty?
    puts 'There are no books to display.'
  else
    puts 'All Books:'
    books.each { |book| puts "- #{book.title} by #{book.author}" }
  end
end

def list_all_music_albums(music_albums)
  if music_albums.empty?
    puts 'There are no music albums to display.'
  else
    puts 'All Music Albums:'
    music_albums.each { |album| puts "- #{album.title} by #{album.artist}" }
  end
end

def list_all_movies(movies)
  if movies.empty?
    puts 'There are no movies to display.'
  else
    puts 'All Movies:'
    movies.each { |movie| puts "- #{movie.title} directed by #{movie.director}" }
  end
end

def list_all_games(games)
  if games.empty?
    puts 'There are no games to display.'
  else
    puts 'All Games:'
    games.each { |game| puts "- #{game.title} by #{game.developer}" }
  end
end

def list_all_genres(books, music_albums, movies, games)
  genres = []
  books.each { |book| genres += book.genres }
  music_albums.each { |album| genres += album.genres }
  movies.each { |movie| genres += movie.genres }
  games.each { |game| genres += game.genres }
  genres.uniq!
  if genres.empty?
    puts 'There are no genres to display.'
  else
    puts 'All Genres:'
    genres.each { |genre| puts "- #{genre}" }
  end
end

def list_all_labels(books, music_albums, movies, games)
  labels = []
  books.each { |book| labels += book.labels }
  music_albums.each { |album| labels += album.labels }
  movies.each { |movie| labels += movie.labels }
  games.each { |game| labels += game.labels }
  labels.uniq!
  if labels.empty?
    puts 'There are no labels to display.'
  else
    puts 'All Labels:'
    labels.each { |label| puts "- #{label}" }
  end
end

def list_all_authors(books)
  authors = books.map(&:author).uniq
  if authors.empty?
    puts 'There are no authors to display.'
  else
    puts 'All Authors:'
    authors.each { |author| puts "- #{author}" }
  end
end

def list_all_sources(books, music_albums, movies, games)
  sources = []
  books.each { |book| sources += book.sources }
  music_albums.each { |album| sources += album.sources }
  movies.each { |movie| sources += movie.sources }
  games.each { |game| sources += game.sources }
  sources.uniq!
  if sources.empty?
    puts 'There are no sources to display.'
  else
    puts 'All Sources:'
    sources.each { |source| puts "- #{source}" }
  end
end

def add_book(_books)
  puts 'Enter the book title:'
  title = gets.chomp
  puts 'Enter the book author:'
  author = gets.chomp
  puts 'Enter the book published date (YYYY-MM-DD):'
  published_date = Date.parse(gets.chomp)
  puts 'Enter the book genres (separated by commas)'
end

if user_input == '1'
  puts 'Listing all books...'
  Library.instance.books.each do |book|
    puts "Title: #{book.title}"
    puts "Author: #{book.author}"
    puts "Genre: #{book.genre}"
    puts "Published date: #{book.published_date}"
    puts "Archived: #{book.archived}"
    puts '------------------------'
  end
end
