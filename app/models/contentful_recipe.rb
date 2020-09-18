class ContentfulRecipe
  def initialize(entry)
    @entry = entry
  end

  def to_props(context)
    fields.slice(:title, :description)
          .update(photoUrl: fields[:photo].url)
  end

  private

  def fields
    @entry.fields
  end
end