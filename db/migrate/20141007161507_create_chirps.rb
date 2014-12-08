class CreateChirps < ActiveRecord::Migration
  def change
    create_table :chirps do |t|
      t.text :body
      t.references :user, index: true

      t.timestamps
    end
  end
end
