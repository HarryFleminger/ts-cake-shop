class RemoveCommentColumnFromLineItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :line_items, :comment
  end
end
