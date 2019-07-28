class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :username
      t.string :country
      t.string :name
      t.integer :age
      t.string :jobs
      t.string :biography
      t.string :prof_image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
