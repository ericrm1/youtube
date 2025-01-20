class Video < ApplicationRecord
  has_one_attached :file
  has_one_attached :thumbnail

  belongs_to :channel
  
  has_many :histories
  has_many :watching_channels, through: :histories, source: :channel

  validates :title, presence: true
  validates :thumbnail, presence: true
  validates :file, presence: true

end

