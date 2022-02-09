class Movie < ApplicationRecord
    def characters
        Character.where({movie_id: read_attribute(:id)})
    end
end
