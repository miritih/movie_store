# frozen_string_literal: true

module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      attributes :username, :movies

      def movies
        object.movies.map do |movie|
          MovieSerializer.new(movie).attributes
        end
      end
    end
  end
end
