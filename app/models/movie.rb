class Movie < ActiveRecord::Base
  # Establish the database connection (e.g., using SQLite)
  ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: ':memory:'
  )

  # Set up the movies table
  ActiveRecord::Schema.define do
    create_table :movies do |t|
      t.string :title
      t.integer :release_date
      t.string :director
      t.string :lead
      t.boolean :in_theaters
    end
  end

  # Validations
  validates :title, presence: true

  # Class methods

  def self.create_with_title(title)
    movie = Movie.new(title: title)
    movie.save
    movie
  end

  def self.first_movie
    Movie.first
  end

  def self.last_movie
    Movie.last
  end

  def self.movie_count
    Movie.count
  end

  def self.find_movie_with_id(id)
    Movie.find_by(id: id)
  end

  def self.find_movie_with_attributes(attributes)
    Movie.find_by(attributes)
  end

  def self.find_movies_after_2002
    Movie.where('release_date > ?', 2002)
  end

  def self.update_all_titles(new_title)
    Movie.update_all(title: new_title)
  end

  def self.delete_by_id(id)
    movie = Movie.find_by(id: id)
    movie.destroy if movie
  end

  def self.delete_all_movies
    Movie.delete_all
  end

  # Instance methods

  def in_theaters?
    in_theaters
  end

  def update_with_attributes(attributes)
    update(attributes)
  end
end
