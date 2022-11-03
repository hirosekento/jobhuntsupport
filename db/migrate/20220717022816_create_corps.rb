class CreateCorps < ActiveRecord::Migration[7.0]
  def change
    create_table :corps do |t|
      t.string      :name
      t.integer     :wish_lv
      t.timestamps
    end
  end
end
