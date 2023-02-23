require_relative '../modules/book'
require_relative '../modules/author'
require_relative '../modules/game'
require_relative '../modules/genre'
require_relative '../modules/label'
require_relative '../modules/music_album'
require_relative './split'
require_relative '../handlers/book_handler'
require_relative '../handlers/music_album_handler'
require_relative '../handlers/game_handler'
require_relative '../handlers/author_handler'
require_relative '../handlers/genre_handler'
require_relative '../handlers/label_handler'

class Main
  include Split
  include BookHandler
  include MusicHandler
  include GameHandler
  include AuthorHandler
  include GenreHandler
  include LabelHandler

  def initialize
    super
    @books = fetch_books
    @music_albums = fetch_albums
    @games = fetch_games
    @genres = fetch_genres
    @labels = fetch_labels
    @authors = fetch_authors
  end

  COLOR_CODES = {
    red: "\e[31m",
    green: "\e[32m",
    yellow: "\e[33m",
    blue: "\e[34m",
    reset: "\e[0m"
  }.freeze

  def user_input(text)
    print text
    gets.chomp
  end

  def operation(input)
    case input
    when 1..6
      list_all(input)
    when 7..9
      add_media(input - 6)
    else
      puts 'Please choose a valid option number'
    end
  end

  def list_all(input)
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
    end
  end

  def add_media(input)
    case input
    when 1
      add_book
    when 2
      add_music_album
    when 3
      add_game
    end
  end

  def run
    loop do
      display_menu
      input = user_input('Choose an option: ').to_i
      break if input == 10

      operation(input)
    end
    save_data
  end

  def display_menu
    puts "\nChoose an Option by entering a number: "
    puts '1- List all books'
    puts '2- List all music albums'
    puts '3- List of games'
    puts '4- List all genres'
    puts '5- List all labels'
    puts '6- List all authors'
    puts '7- Add a book'
    puts '8- Add a music album'
    puts '9- Add a game'
    puts '10- Quit'
  end

  def save_data
    save_books(@books)
    save_albums(@music_albums)
    save_games(@games)
    save_author(@authors)
    save_label(@labels)
    save_genre(@genres)
  end

  private

  def list_all_books
    if @books.empty?
      puts "#{COLOR_CODES[:red]}\nNo books found.#{COLOR_CODES[:reset]}"
    else
      @books.each do |book|
        puts "date: #{book.published_date}, publisher: #{book.publisher}, cover_state: #{book.cover_state}"
      end
    end
  end

  def list_all_music_albums
    if @music_albums.empty?
      puts "#{COLOR_CODES[:red]}\nNo album found.#{COLOR_CODES[:reset]}"
    else
      @music_albums.each do |album|
        puts "published date: #{album.published_date}, on spotify: #{album.on_spotify}"
      end
    end
  end

  def on_spotify
    permit = user_input('on spotify? [Y/N]:')
    case permit
    when 'Y', 'y'
      true
    when 'N', 'n'
      false
    end
  end

  def list_all_games
    if @games.empty?
      puts "#{COLOR_CODES[:red]}\nNo games found.#{COLOR_CODES[:reset]}"
    else
      @games.each do |game|
        puts "published date: #{game.published_date}, " \
             "multiplayer: #{game.multiplayer}, " \
             "last played at: #{game.last_played_at}"
      end
    end
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
