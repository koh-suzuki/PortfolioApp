# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |n|
  User.create!(
    email: "test_#{n + 1}@email.com",
    password: "password",
  )
end

User.all.each do |user|
  3.times do |n|
    Profile.create!(
      name: "テスト_#{n + 1}",
      user_id: user.id
    )
  end
end

User.all.each do |user|
  20.times do |n|
    user.articles.create!(
      content: "今日は#{n + 1}つ目の日記です。",
      created_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
      user_id: user.id
    )
  end
end



 