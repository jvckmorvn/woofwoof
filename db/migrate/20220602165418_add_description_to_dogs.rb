class AddDescriptionToDogs < ActiveRecord::Migration[7.0]
  def change
    add_column :dogs, :description, :text
  end
end
