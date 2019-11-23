class AddColoumTo < ActiveRecord::Migration[5.2]
  def change

   # 追加
   add_column :profiles, :food, :string
   add_column :profiles, :station, :string

 end
end
