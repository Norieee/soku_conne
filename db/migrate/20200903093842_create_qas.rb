class CreateQas < ActiveRecord::Migration[6.0]
  def change
    create_table :qas do |t|
      t.integer :no      , null: false
      t.string  :category, null: false
      t.string  :question, null: false
      t.string  :answer  , null: false
      t.timestamps
    end
  end
end
