class AddCommentToLineItems < ActiveRecord::Migration[7.0]
  def change
    add_column :line_items, :comment, :string
  end
end
