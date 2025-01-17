class Channel < ApplicationRecord
    has_secure_password
    has_one_attached :photo
    has_many :videos
    validates :name, presence: true
    validates :email,presence:true
    validates :password, presence: true, length: {minimum: 6 }

    


end
