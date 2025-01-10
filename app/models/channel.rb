class Channel < ApplicationRecord
    has_many :videos
    has_secure_password
    validates :name, presence: true
    validates :email,presence:true
    validates :password, presence: true, length: {minimum: 6 }

    


end
