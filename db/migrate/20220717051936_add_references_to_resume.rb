class AddReferencesToResume < ActiveRecord::Migration[7.0]
  def change
    add_reference :resumes, :corp, null: false, foreign_key: true
  end
end
