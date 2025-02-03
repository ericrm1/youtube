class Rating < ApplicationRecord
  belongs_to :channel
  belongs_to :video

  # validates :value
  validates :channel_id, uniqueness: {scope: :video_id, message: "só pode dar um like/dislike por vídeo"}
end
