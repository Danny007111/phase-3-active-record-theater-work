class Role < ActiveRecord::Base
    has_many :auditions

    #actors returns an array of names from the actors associated with this role
    def actors
        self.auditions do |actors|
            actors.actor
        end
    end
    #locations returns an array of locations from the auditions associated with this role
    def locations
        self.auditions do |actors|
            actors.location
        end
    end
    #lead returns the first instance of the audition that was hired for this role or returns a string 'no actor has been hired for this role'
    def lead
        Audition.first unless Audition.first == nil
        puts "no actor has been hired for this role"
    end
    #understudy returns the second instance of the audition that was hired for this role or returns a string 'no actor has been hired for understudy for this role'
    def understudy
        Audition.second unless Audition.first == nil
        puts "no actor has been hired for this role"
    end
end