class Video < ApplicationRecord
  has_one_attached :file
  has_one_attached :thumbnail

  belongs_to :channel

  validates :title, presence: true
  validates :thumbnail, presence: true
  validates :file, presence: true

end
