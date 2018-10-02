
class Availability < ApplicationRecord
    belongs_to :user

    def prune_availability
        #delete old availabilities (24 hours)
        #availability.time < 1.days.from_now
        Availability.where("time <= ?", 24.hours.from_now).destroy_all
    end
end
