class CreateQues < ActiveRecord::Migration[7.0]
  def change
    create_table :ques do |t|
      t.string :title

      t.timestamps
    end
  end
end
