class SongValidator < ActiveModel::Validator 

    def validate(record)
        if record.released 
            if record.release_year.nil?
            record.errors[:release_year] << "No release year!"
         elsif record.release_year > Date.current.year 
            record.errors[:release_year] << "Release date is in the future!"
         end 
        end 
    end 
end 