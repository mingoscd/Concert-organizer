class AddRelationshipCommentsConcerts < ActiveRecord::Migration
  def change
  	add_column :concerts, :comment_id, :integer
  	add_column :comments, :concert_id, :integer
  end
end
