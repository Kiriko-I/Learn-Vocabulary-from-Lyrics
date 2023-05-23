# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'admin@example.com',
  password: 'password'
)

users = User.create!(
  [
    {email: 'a@sample.com', password: 'password', name: '加瀬 早織', nickname: '加瀬 早織', prefecture: 12, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.png"), filename:"sample-user1.png")},
    {email: 'b@sample.com', password: 'password', name: '西田 直人', nickname: '西田 直人', prefecture: 14, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.png"), filename:"sample-user2.png")},
    {email: 'c@sample.com', password: 'password', name: '比嘉 めぐみ', nickname: '比嘉 めぐみ', prefecture: 1, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.png"), filename:"sample-user3.png")},
  ]
)

Post.create!(
  [
    {prefecture: 12, city: '千葉市中央区', landmark: '中央区役所前バス停', sidewalk: 3, snow_height: 3, snow_state: 2, message: '歩きにくいですが、今日も仕事頑張ります', latitude: 35.609001, longitude: 140.124588, snow_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"), user_id: users[0].id},
    {prefecture: 14, city: '神奈川県横浜市', landmark: '石川町駅', sidewalk: 4, snow_height: 2, snow_state: 1, message: '結構ふぶいてます', latitude: 35.439231, longitude: 139.642468, snow_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"), user_id: users[1].id},
    {prefecture: 1, city: '美瑛町', sidewalk: 4, snow_height: 4, snow_state: 1, message: '歩く場所ありません…', latitude: 43.588280, longitude: 142.467056, snow_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg"), user_id: users[2].id},
  ]
)