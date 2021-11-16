class Gener < ApplicationRecord
  validate :name, presence: true
  has_many :movies, through: :movie_genres
end
