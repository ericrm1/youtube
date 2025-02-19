class Subscription < ApplicationRecord
    belongs_to :channel 
    belongs_to :subscriber, class_name: "Channel"

<<<<<<< HEAD
    validates :subscriber_id, uniqueness: false 
end 
=======
    validates :subscriber_id, uniqueness: false
end
>>>>>>> origin/main
