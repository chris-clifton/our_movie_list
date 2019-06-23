class Movie < ApplicationRecord
  has_one_attached :poster
  has_many :movie_lists
  has_many :movies, through: :movie_lists, dependent: :destroy
  validates :name, presence: true, length: { maximum: 50 }, 
                   uniqueness: true

  # Currently working off character-length in view of small-size movie poster
  def short_name
    if name.length > 17
      name[0...14] + "..."
    else
      name
    end
  end

end
