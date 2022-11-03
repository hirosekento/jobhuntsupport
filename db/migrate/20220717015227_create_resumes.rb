class CreateResumes < ActiveRecord::Migration[7.0]
  def change
    create_table :resumes do |t|
      t.string      :title
      t.integer     :type_id
      t.timestamps
    end
  end
end
