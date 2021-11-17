# frozen_string_literal: true

class Genre < ApplicationRecord
  validates_uniqueness_of :name
  validates :name, length: { maximum: 20 }, allow_blank: false

  has_many :movie_genres
  has_many :movies, through: :movie_genres

  enum name: { Action: 'Action', Adventure: 'Adventure', Animation: 'Animation',
               Biography: 'Biography', Comedy: 'Comedy', Crime: 'Crime',
               Documentary: 'Documentary', Drama: 'Drama', Fantasy: 'Fantasy',
               History: 'History', Horror: 'Horror', Musical: 'Musical',
               Mystery: 'Mystery', Romance: 'Romance', SciFi: 'SciFi', Thriller: 'Thriller',
               War: 'War', Western: 'Western' }
end
