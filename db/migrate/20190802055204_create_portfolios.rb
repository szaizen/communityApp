class CreatePortfolios < ActiveRecord::Migration[5.2]
  
  def change
    create_table :portfolios do |t|
      t.string :name
      t.string :url
      t.date :created_date
      t.string :detail
      t.string :port_image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end

end
