class Gener < ApplicationRecord
  has_many :movies, through: :movie_genres

  enum name: [:Action, :Adventure, :Animation, :Biography, :Comedy,
                :Crime, :Documentary, :Drama, :Fantasy, :History, :Horror,
                :Musical, :Mystery, :Romance, :SciFi, :Thriller, :War, :Western]
end
