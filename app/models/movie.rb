class Movie < ApplicationRecord
  validates :name, length: { minimum: 80 }, allow_blank: false
  validates :year, length: { minimum: 4 }, allow_blank: false
  validates :director, length: { minimum: 60 }
  validates :star, length: { minimum: 60 }
  validates :description, length: { minimum: 400 }

  has_many :movies, through: :movie_genres
end
