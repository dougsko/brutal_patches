class Patch < ActiveRecord::Base
    after_save :update_title

    private 
    def update_title
        if self.title == ""
            title = "Patch #" + self.id.to_s
            self.update_column(:title, title)
        end
    end
end
