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
  # as_usual=いつもどおりの歩道, no_sidewalk=歩道のない道路だがいつもどおり歩ける, 
  # two_people=（雪はあるが）対面通行できる, one_person=一人通れるだけの幅はある,
  # walk_roadway=歩道が埋まっているので車道を歩く, cannnot_walk=道を歩くことができない
  enum snow_height_method: {
    no_snow: 0, sparse_snow: 1, remain_footprints: 2,buried_shoes: 3,
    same_as_knees: 4, above_knees: 5, cannot_go_outside: 6
  }
  # no_snow=雪なし, sparse_snow=まばらに雪がある, remain_footprints=足跡が残るくらい,
  # buries_shoes=靴が埋もれるくらい, same_as_knees=ひざ下～ひざ位, above_knees=ひざ上,
  # cannot_go_outside=外に出られない
  enum snow_state_method: {
    nothing: 0, powder: 1, fluffy: 2, compacted: 3, slippery: 4, melting: 5
  }
  # nothing=雪なし, powder=さらさら, fluffy=ふわふわ, compacted=踏まれたり雨が降ったりしてかたい,
  # slippery=凍っていて滑りやすい, melting=溶けてぐちゃぐちゃ
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
