class List < ApplicationRecord
  belongs_to :user
  has_many :movie_lists
  has_many :movies, through: :movie_lists, dependent: :destroy
  
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }

  # Orders lists but not in love with how this makes ActiveRecord
  # default_scope -> {order(created_at: :desc)}
end
