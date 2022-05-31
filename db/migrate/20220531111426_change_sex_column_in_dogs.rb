class ChangeSexColumnInDogs < ActiveRecord::Migration[7.0]
  def change
    change_column :dogs, :sex, :boolean, using: 'sex::boolean'
  end
end
