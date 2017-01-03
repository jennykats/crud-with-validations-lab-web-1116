class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {
    scope: [:release_year, :artist_name],
    message: "cannot be repeated by the same artist in the same year"
  }
  validate :released_boolean
  validates :release_year, numericality: { less_than_or_equal_to: Time.now.year, allow_nil: true }
  validates :artist_name, presence: true





private

  # def same_details
  #   same_songs = Song.where(release_year: self.release_year).where(artist_name: self.artist_name).where(title: self.title)
  #   if same_songs.length > 1
  #     errors.add(:title, "cannot have the same song in the same year")
  #   end
  # end

  def released_boolean
    if released == true && !release_year
      errors.add(:released, "cannot be empty if true")
    end
  end


end
