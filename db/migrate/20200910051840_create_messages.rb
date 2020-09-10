class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer    :gist_id     , null: false
      t.integer    :urgency_id  , null: false
      t.integer    :response_id , null: false
      t.integer    :res_type_id
      t.integer    :content_id  , null: false
      t.string     :sup_content
      t.integer    :status_id   , null: false
      t.string     :others
      t.references :user        , foreign_key: true
      t.references :project     , foreign_key: true
      t.timestamps
    end
  end
end
