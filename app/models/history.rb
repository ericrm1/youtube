class History < ApplicationRecord
  belongs_to :channel
  belongs_to :video

  has_many :videos
end
