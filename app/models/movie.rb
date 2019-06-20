class Movie < ApplicationRecord
  has_many :movie_lists
  has_many :movies, through: :movie_lists, dependent: :destroy
  validates :name, presence: true, length: { maximum: 50 }, 
                   uniqueness: true

end
