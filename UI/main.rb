require_relative '../modules/book'
require_relative '../modules/author'
require_relative '../modules/game'
require_relative '../modules/genre'
require_relative '../modules/label'
require_relative '../modules/music_album'

class Main
  def initialize
    super
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
    title = user_input('Enter Book Title: ')
    color = user_input('Enter Book Color: ')
    label = Label.new(title, color)
    genre_name = user_input('Enter Book Genre: ')
    genre = Genre.new(genre_name)
    author_firstname = user_input('Enter Author First Name: ')
    author_lastname = user_input('Enter Author Last Name: ')
    author = Author.new(author_firstname, author_lastname)
    publish_date = user_input('published_date [DD/MM/YYYY]: ')
    publisher = user_input('publisher: ')
    cover_state = user_input('cover_state [good/bad]: ')
    newbook = Book.new(publish_date, publisher, cover_state)
    newbook.label = label
    newbook.genre = genre
    newbook.author = author

    @books << newbook
    @genres << genre
    @labels << label
    @authors << author

    puts 'Book Added Succesfully'
  end

  def list_all_music_albums
    @music_albums.each do |album|
      puts "published date: #{album.published_date}, on spotify: #{album.on_spotify}"
    end
  end

  def add_music_album
    title = user_input('Enter Album Title: ')
    color = user_input('Enter Album Color: ')
    label = Label.new(title, color)
    genre_name = user_input('Enter Album Genre: ')
    genre = Genre.new(genre_name)
    author_firstname = user_input('Enter Author First Name: ')
    author_lastname = user_input('Enter Author Last Name: ')
    author = Author.new(author_firstname, author_lastname)
    publish_date = user_input('published_date [DD/MM/YYYY]: ')
    spotify = on_spotify
    newmusic = Music.new(publish_date, spotify)
    newmusic.label = label
    newmusic.genre = genre
    newmusic.author = author

    @music_albums << newmusic
    @genres << genre
    @labels << label
    @authors << author

    puts 'Music album and label created'
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
    title = user_input('Enter Game Title: ')
    color = user_input('Enter Game Color: ')
    label = Label.new(title, color)
    genre_name = user_input('Enter Game Genre: ')
    genre = Genre.new(genre_name)
    author_firstname = user_input('Enter Author First Name: ')
    author_lastname = user_input('Enter Author Last Name: ')
    author = Author.new(author_firstname, author_lastname)
    publish_date = user_input('Published_date [DD/MM/YYYY]: ')
    multiplayer = user_input('Multiplayer: ')
    lastplayed = user_input('Last played at [DD/MM/YYYY]: ')
    newgame = Game.new(publish_date, multiplayer, lastplayed)

    newgame.label = label
    newgame.genre = genre
    newgame.author = author

    @games << newgame
    @genres << genre
    @labels << label
    @authors << author
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
