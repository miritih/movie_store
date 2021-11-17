class User < ApplicationRecord
  validates :username, format: { with: /\A[a-z_A-Z0-9]+\z/,
    message: "only alphanumeric characters and underscore are allowed" }

  has_many :favorites, dependent: :delete_all
  has_many :movies, through: :favorites, dependent: :delete_all

  enum role: [:user, :admin]
end
