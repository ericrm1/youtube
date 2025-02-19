class Subscription < ApplicationRecord
    belongs_to :channel 
    belongs_to :subscriber, class_name: "Channel"

    validates :subscriber_id, uniqueness: false 
end
