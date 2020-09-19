module ContentfulCdn
  class Recipe
    def initialize(entry, formatting)
      @entry = entry
      @formatting = formatting
    end

    def to_h
      {
        title:        @entry.title,
        description:  @formatting.decorate(@entry.description),
        photoUrl:     @entry.photo.url,
        tags:         @entry.fields.fetch(:tags, []).map(&:name),
        chef:         @entry.fields[:chef]&.name 
      }
    end
  end
end