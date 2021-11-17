# frozen_string_literal: true

ActiveAdmin.register Movie do
  filter :name
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :year, :director, :star, :description
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :year, :director, :star, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    id_column
    column :name do |movie|
      link_to movie.name, edit_admin_movie_path(movie)
    end
    column :year
    column :director
    column '# times Favorited' do |movie|
      movie.favorites.count
    end
    actions
  end

  form do |f|
    f.inputs 'Movie Details' do
      f.input :name
      f.input :year, label: 'Year', as: :select, collection: (1900..2021).to_a
      f.input :director
      f.input :star, label: 'Main Star'
      f.input :description
      f.input :favorited, input_html: { disabled: true, value: object.favorites.count }

      f.input :genre_ids, label: 'Genres', as: :select, multiple: true, collection: Genre.all,
                          input_html: { value: object.genres }

    end

    actions
  end

  controller do
    def create
      @movie = Movie.new(permitted_params[:movie])
      @movie.genres << Genre.where(id: params[:movie][:genre_ids].reject(&:empty?)) if @movie.save
      super
    end

    def permitted_params
      params.permit!
    end
  end
end
