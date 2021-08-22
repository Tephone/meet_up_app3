class ChangeColumnsToNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :teachers, :image, false
    change_column_default :teachers, :image, nil
  end
end
