class AddColumnToMovies < ActiveRecord::Migration
  def change
    change_table :movies do |t|
      t.column :user_id, :integer
    end
  end
end