class AddTopicRefToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :topic, index: true
    add_foreign_key :posts, :topics
  end
end
