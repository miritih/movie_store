# frozen_string_literal: true

class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :name, limit: 80
      t.integer :year, limit: 4
      t.string :director, limit: 60
      t.string :star, limit: 60
      t.text :description, limit: 400

      t.timestamps
    end
  end
end
