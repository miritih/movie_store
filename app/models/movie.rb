class Movie < ApplicationRecord
  validates :name, length: { maximum: 80 }, allow_blank: false
  validates :year, length: { maximum: 4 }, allow_blank: false
  validates :director, length: { maximum: 60 }
  validates :star, length: { maximum: 60 }
  validates :description, length: { maximum: 400 }
  validates_uniqueness_of :name

  has_many :movie_genres, dependent: :delete_all
  has_many :genres, through: :movie_genres, dependent: :delete_all

  has_many :favorites, dependent: :delete_all
  has_many :users, through: :favorites, dependent: :delete_all

  accepts_nested_attributes_for :movie_genres, :allow_destroy => true
end
