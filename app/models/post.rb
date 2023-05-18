class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :snow_image
  validates :message, length: { maximum: 70 }
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  enum sidewalk_method: {
    "いつもどおり歩ける　　　　　　　　": 0,
    "歩道のない道路だがいつもどおり歩ける": 1,
    "２人通れる幅がある　　　　　　　": 2,
    "１人しか通れない　　　　　　　　": 3,
    "車道を歩くしかない　　　　　　　　": 4,
    "どこも歩けない": 5
  }
  enum snow_height_method: {
    "雪はない　　　　": 0,
    "まばらに雪がある　": 1,
    "足あとが残るくらい": 2,
    "靴が埋もれるくらい": 3,
    "ひざ下～ひざ位　": 4,
    "ひざ上以上　　　": 5,
    "家から出られない": 6
  }, _prefix: true
  enum snow_state_method: {
    "雪はない　　　　": 0,
    "さらさら 　　　　": 1,
    "ふわふわ　　　　": 2,
    "どっしりかたい　　": 3,
    "つるつる滑りやすい": 4,
    "溶けてぐちゃぐちゃ": 5
  }, _prefix: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search_for(prefecture, city)
		# 全国を選択し市区町村名を入力している場合は、市区町村名のみで検索する。
		if prefecture == '0'
		  Post.where('city LIKE ?', "%#{city}%")
		else
		  Post.where(['prefecture LIKE ? AND city LIKE ?', "#{prefecture}", "%#{city}%"])
		end
  end

end
