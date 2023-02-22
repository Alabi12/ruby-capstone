require_relative '../modules/book'
require_relative '../modules/author'
require_relative '../modules/game'
require_relative '../modules/genre'
require_relative '../modules/label'
require_relative '../modules/music_album'

module Split
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
end
