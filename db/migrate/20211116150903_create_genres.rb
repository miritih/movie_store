# frozen_string_literal: true

class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      t.string :name, limit: 60

      t.timestamps
    end
  end
end
