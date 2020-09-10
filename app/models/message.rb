class Message < ApplicationRecord
  belongs_to :project
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :gist
  belongs_to_active_hash :urgency
  belongs_to_active_hash :response
  belongs_to_active_hash :res_type
  belongs_to_active_hash :content
  belongs_to_active_hash :status

  validates :gist, :urgency, :response, :content, :status, presence: true

  with_options numericality: { greater_than_or_equal_to: 1 } do
    validates :gist_id, :urgency_id, :response_id, :content_id, :status_id
  end
end