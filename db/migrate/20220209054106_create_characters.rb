class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :movie_id
      t.string :movie
      t.integer :person_id
      t.string :actor
      t.timestamps
    end
  end
end
