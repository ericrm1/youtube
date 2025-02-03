class Video < ApplicationRecord
  has_one_attached :file
  has_one_attached :thumbnail

  belongs_to :channel
  
  has_many :histories
  has_many :watching_channels, through: :histories, source: :channel
  has_many :ratings, dependent: :destroy
  
  has_many :comments

  validates :title, presence: true
  validates :thumbnail, presence: true
  validates :file, presence: true
 
  def likes_count
    ratings.where(value: 1).count
  end

  def dislikes_count
    ratings.where(value: -1).count
  end
end

