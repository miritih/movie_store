class User < ApplicationRecord
  validates :username, format: { with: /\A[a-z_A-Z0-9]+\z/,
    message: "only alphanumeric characters and underscore are allowed" }
end
