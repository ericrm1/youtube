class History < ApplicationRecord
  belongs_to :channel
  belongs_to :video

  validates :channel_id, uniqueness: false
end