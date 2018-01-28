class CreateMovies < ActiveRecord::Migration
  def change
    create_table :moviess do |t|
      t.string :name
    end
  end
end
