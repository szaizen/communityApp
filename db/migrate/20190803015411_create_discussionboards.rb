class CreateDiscussionboards < ActiveRecord::Migration[5.2]
  def change
    create_table :discussionboards do |t|
      t.string :title
      t.string :category
      t.string :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
