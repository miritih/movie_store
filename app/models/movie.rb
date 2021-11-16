class Movie < ApplicationRecord
  validates :name, length: { maximum: 80 }, allow_blank: false
  validates :year, length: { maximum: 4 }, allow_blank: false
  validates :director, length: { maximum: 60 }
  validates :star, length: { maximum: 60 }
  validates :description, length: { maximum: 400 }

  has_many :movies, through: :movie_genres
end
