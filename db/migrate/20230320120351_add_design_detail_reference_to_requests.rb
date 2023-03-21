class AddDesignDetailReferenceToRequests < ActiveRecord::Migration[7.0]
  def change
    add_reference :requests, :design_detail, null: true, foreign_key: true
  end
end
