class CreateProUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :pro_users do |t|
      t.references :user   , foreign_key: true
      t.references :project, foreign_key: true
      t.timestamps
    end
  end
end
