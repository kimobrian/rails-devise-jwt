class CreateApiPosts < ActiveRecord::Migration[7.1]
  def change
    create_table :api_posts do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
