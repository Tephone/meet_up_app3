class ChangeColumnsToNullOnTeachers < ActiveRecord::Migration[6.1]
  def change
    change_column_null :teachers, :image, true
  end
end
