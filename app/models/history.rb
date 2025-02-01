class History < ApplicationRecord
  belongs_to :channel
  belongs_to :video

  validates :channel_id, uniqueness: {scope: :video_id, message: "Já assistiu esse vídeo"}
end