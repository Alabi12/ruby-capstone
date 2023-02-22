require_relative '../modules/book'
require_relative '../modules/author'
require_relative '../modules/game'
require_relative '../modules/genre'
require_relative '../modules/label'
require_relative '../modules/music_album'

class Main
  def initialize
    @books = []
    @music_albums = []
    @games = []
    @genres = []
    @labels = []
    @authors = []
  end

  def user_input(text)
    print text
    gets.chomp
  end

  def operation(input)
    case input
    when 1
      list_all_books
    when 2
      list_all_music_albums

    when 3
      list_all_games
    when 4
      list_all_genres
    when 5
      list_all_labels
    when 6
      list_all_authors
    when 7
      add_book
    when 8
      add_music_album
    when 9
      add_game
    else
      puts 'Please choose a valid option number'
    end
  end

  def run
    puts 'Choose an Option'
    loop do
      puts '
                1- List all books
                2- List all music albums
                3- List of games
                4- List all genres
                5- List all labels
                6- List all authors
                7- Add a book
                8- Add a music album
                9- Add a game
                10- Quit '

      input = user_input('Choose an option: ').to_i

      break if input == 10

      operation(input)
    end
  end

  def list_all_books
    @books.each do |book|
      puts "date: #{book.published_date}, publisher: #{book.publisher}, cover_state: #{book.cover_state}"
    end
  end

  def add_book
    publish_date = user_input('published_date [DD/MM/YYYY]: ')
    publisher = user_input('publisher: ')
    cover_state = user_input('cover_state [good/bad]: ')
    @books << Book.new(publish_date, publisher, cover_state)
    puts 'Book Added Succesfully'
  end

  def list_all_music_albums
    @music_albums.each do |album|
      puts "published date: #{album.published_date}, on spotify: #{album.on_spotify}"
    end
  end

  def add_music_album
    publish_date = user_input('published_date [DD/MM/YYYY]: ')
    spotify = on_spotify
    @music_albums << Music.new(publish_date, spotify)
  end

  def on_spotify
    puts 'on spotify? [Y/N]:'
    permit = gets.chomp
    case permit
    when 'Y', 'y'
      true
    when 'N', 'n'
      false
    end
  end

  def list_all_games
    @games.each do |game|
      puts "published date: #{game.published_date}, multiplayer: #{game.multiplayer}, last played at: #{game.last_played_at}"
    end
  end

  def add_game
    publish_date = user_input('published_date [DD/MM/YYYY]: ')
    multiplayer = user_input('multiplayer: ')
    lastplayed = user_input('last played at [DD/MM/YYYY]: ')
    @games << Game.new(publish_date, multiplayer, lastplayed)
  end

  def list_all_genres
    @genres.each do |genre|
      puts "name: #{genre.name}"
    end
  end

  def list_all_labels
    @labels.each do |label|
      puts "title: #{label.title}, color: #{label.color}"
    end
  end

  def list_all_authors
    @authors.each do |author|
      puts "first name: #{author.first_name}, last name: #{author.last_name}"
    end
  end
end

app = Main.new
app.run
