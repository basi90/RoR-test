class AddPostedAtToBlogPosts < ActiveRecord::Migration[8.1]
  def change
    add_column :blog_posts, :posted_at, :datetime
  end
end
