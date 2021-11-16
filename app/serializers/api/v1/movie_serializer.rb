module Api
  module V1
    class MovieSerializer < ActiveModel::Serializer
      attributes :name, :year, :director, :star, :description, :genres

      def genres
        object.genres.map do |genre|
          genre.name
        end
      end

    end
  end
end
