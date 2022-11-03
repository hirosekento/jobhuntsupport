class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.text      :que
      t.text      :content
      t.integer   :que_type
      t.timestamps
      t.references :resume , foreign_key: true
    end
  end
end
