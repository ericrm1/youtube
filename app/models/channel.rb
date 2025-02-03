class Channel < ApplicationRecord
    has_secure_password
    has_one_attached :photo

    has_many :videos
    has_many :comments
    has_many :histories
    has_many :ratings, dependent: :destroy

    validates :name, presence: true
    validates :email,presence:true
    validates :password, presence: true, length: {minimum: 6 }

    def watched_videos
        videos = []
        histories.each do |history|
            videos << history.video
        end
        return videos 
    end
end
