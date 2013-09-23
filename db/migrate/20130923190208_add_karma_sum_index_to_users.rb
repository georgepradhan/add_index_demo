class AddKarmaSumIndexToUsers < ActiveRecord::Migration
  def change
    add_index :users, :sum_karma, order: { sum_karma: :desc }
  end
end
