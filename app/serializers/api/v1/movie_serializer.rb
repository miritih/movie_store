module Api
  module V1
    class MovieSerializer < ActiveModel::Serializer
      attributes :name, :year, :director, :star, :description
    end
  end
end
