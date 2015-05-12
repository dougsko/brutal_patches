class Patch < ActiveRecord::Base
    after_save :update_title

    has_many :ratings
    accepts_nested_attributes_for :ratings

    searchkick

    private 
    def update_title
        if self.title == ""
            title = "Patch #" + self.id.to_s
            self.update_column(:title, title)
        end
    end
end
