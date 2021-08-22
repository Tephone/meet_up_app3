class AddColumnsToTeachers < ActiveRecord::Migration[6.1]
  def change
    add_column :teachers, :name, :string, null: false
    add_column :teachers, :profile, :text, default: '', null: false
    add_column :teachers, :image, :text, default: '', null: false 
    add_reference :teachers, :language, null: false, foreign_key: true
  end
end
