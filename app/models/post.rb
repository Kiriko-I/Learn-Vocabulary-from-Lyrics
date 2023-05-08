class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :snow_image
  validates :message, length: { maximum: 70 }

  enum sidewalk_method: {
    as_usual: 0, no_sidewalk: 1, two_people: 2,
    one_person: 3, walk_roadway: 4, cannot_walk: 5
  }
  enum snow_height_method: {
    no_snow: 0, sparse_snow: 1, remain_footprints: 2,buried_shoes: 3,
    same_as_knees: 4, above_knees: 5, cannot_go_outside: 6
  }
  enum snow_state_method: {
    nothing: 0, powder: 1, fluffy: 2, compacted: 3, slippery: 4, melting: 5
  }
end
