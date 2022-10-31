class RemoveUserIdFromCompetitions < ActiveRecord::Migration[7.0]
  def change
    remove_column :competitions, :user_id
  end
end
