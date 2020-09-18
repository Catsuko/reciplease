class ContentfulRecipe
  def initialize(entry, formatting)
    @entry = entry
    @formatting = formatting
  end

  def to_h
    {
      title:        @entry.title,
      description:  @formatting.decorate(@entry.description),
      photoUrl:     @entry.photo.url,
    }
  end
end