class User < ApplicationRecord
    has_many :rides
    has_many :attractions, through: :rides
    validates_presence_of :password

    def mood
        if self.happiness.to_i < self.nausea.to_i
            "sad"
        else
            "happy"
        end
    end

end
