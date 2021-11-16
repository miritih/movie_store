module Api
  module V1
    class MoviesController < ApplicationController
      before_action :set_movie, only: [:show, :update, :destroy]

      # GET /movies
      def index
        movies = Movie.all
        render_response(movies, MovieSerializer)
      end

      # GET /movies/1
      def show
        render_response(@movie, MovieSerializer)
      end

      # POST /movies
      def create
        @movie = Movie.new(movie_params)

        if @movie.save
          render_response(@movie, MovieSerializer,201)
        else
          render json: @movie.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /movies/1
      def update
        if @movie.update(movie_params)
          render_response(@movie, MovieSerializer,200)
        else
          render json: @movie.errors, status: :unprocessable_entity
        end
      end

      # DELETE /movies/1
      def destroy
        @movie.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_movie
          @movie = Movie.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def movie_params
          params.require(:movie).permit(:name, :year, :director, :star, :description)
        end
    end
  end
end
