class RenameImageColumnToPortfolios < ActiveRecord::Migration[5.2]
  def change
    rename_column :portfolios, :image, :port_image
  end
end
