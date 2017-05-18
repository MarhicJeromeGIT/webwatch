class CreateFollowedPages < ActiveRecord::Migration[5.0]
  def change
    create_table :followed_pages do |t|

      t.timestamps
      
      t.string :url
      t.string :selector
      t.text :original_content
      t.references :user
    end
  end
end
