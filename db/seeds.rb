GENRE = %w[Rock Pop Urban DJ Ballads Tropical Regional Country Instrumental Choir].freeze
titles = ["The Future of AI", "Exploring the Deep Sea", "The Power of Renewable Energy", "The Art of Mindfulness", "The Science of Nutrition", "The History of Space Exploration", "The Future of Transportation", "The Power of Positive Thinking", "The Wonders of Nature", "The Evolution of Technology"]
descriptions = ["An in-depth look at the advancements and potential of artificial intelligence.",
  "A journey into the depths of the ocean and the discoveries that await us.",
  "An examination of the benefits and challenges of transitioning to renewable energy sources.",
  "A guide to incorporating mindfulness practices into daily life for improved well-being.",
  "An exploration of the latest research on nutrition and its impact on health.",
  "A retrospective on humanity's journey to explore the cosmos.",
  "A look at the innovations and developments shaping the future of transportation.",
  "An examination of the benefits and techniques of positive thinking for improved mental health.",
  "A celebration of the beauty and diversity of the natural world.",
  "A history of technological advancements and their impact on society."]
datetimes = ["2023-06-11 09:00", "2023-06-12 14:00", "2023-06-13 16:00", "2023-06-14 18:00", "2023-06-15 10:00", "2023-06-16 12:00", "2023-06-17 15:00", "2023-06-18 17:00", "2023-06-19 19:00", "2023-06-20 11:00"]
User.destroy_all
Event.destroy_all
Discover.destroy_all
all_user = []
10.times do |i|
  admin = i % 2 == 0 ? true : false
  user = User.create(email: "user#{i}@example.com", password: "12345678", first_name: "First Name #{i}", last_name: "Last Name #{i}", admin: admin)
  all_user << user
  puts 'User created'
end
10.times do
  index = rand(0...titles.length)
  event = Event.new(
    title: titles[index],
    description: descriptions[index],
    datetime: datetimes.sample,
    duration: rand(30..120),
    genre: GENRE.sample,
    user_id: all_user.sample.id,
    address: ["350 Fifth Ave, New York, NY 10118, USA", "6801 Hollywood Blvd, Los Angeles, CA 90028, USA", "233 S Wacker Dr, Chicago, IL 60606, USA", "1600 Lamar St, Houston, TX 77010, USA", "1 Citizens Bank Way, Philadelphia, PA 19148, USA"].sample
  )
  event.save!
  puts 'Event created'
end
titles = ["Discover 1", "Discover 2", "Discover 3", "Discover 4", "Discover 5"]
contents = ["Content 1", "Content 2", "Content 3", "Content 4", "Content 5"]
10.times do
  discover = Discover.new(
    title: titles.sample,
    content: contents.sample,
    likes: rand(0..100),
    plays: rand(0..100),
    saved: [true, false].sample,
    start_time: rand(1.0..10.0).round(2),
    end_time: rand(10.0..20.0).round(2),
    user_id: all_user.sample.id
  )
  discover.save!
  puts 'Content created'
end
