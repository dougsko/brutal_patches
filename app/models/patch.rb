class Patch < ActiveRecord::Base
    after_save :update_title

    has_many :ratings
    accepts_nested_attributes_for :ratings

    searchkick

    paginates_per 50

    acts_as_taggable # Alias for acts_as_taggable_on :tags
    acts_as_taggable_on :tags

    def search_data
        attributes.merge(tags_name: tags.map(&:name))
    end

    private 
    def update_title
        if self.title == ""
            title = "Patch #" + self.id.to_s
            self.update_column(:title, title)
        end
    end
end
