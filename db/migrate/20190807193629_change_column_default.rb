class ChangeColumnDefault < ActiveRecord::Migration[5.2]
  def change
  change_column_default :photos, :pat_count, 0
  end
end
