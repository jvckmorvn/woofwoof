class CreateDogs < ActiveRecord::Migration[7.0]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.integer :age
      t.string :sex
      t.string :location
      t.float :rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
