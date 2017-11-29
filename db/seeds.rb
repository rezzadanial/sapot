Category.where(name: "Web Development").first_or_create(name: "Web Development")
Category.where(name: "Design").first_or_create(name: "Design")
Category.where(name: "Finance").first_or_create(name: "Finance")
Category.where(name: "Engineering").first_or_create(name: "Engineering")
Category.where(name: "Sales").first_or_create(name: "Sales")
Category.where(name: "Administrative").first_or_create(name: "Administrative")
Category.where(name: "Dispatch").first_or_create(name: "Dispatch")

location = [
  "Shah Alam, Selangor",
  "Johor Baharu, Johor",
  "Georgetown, Penang",
  "Ipoh, Perak",

 
]

User.where(email: "test@mail.com").first_or_create(email: "test@mail.com", name: "test", password: "testtest")

10.times do
  User.create(email: Faker::Internet.email, password: "testtest", name: Faker::Name.name)
end

100.times do
  Gig.create(name: Faker::Name.title,
            description: Faker::Lorem.paragraph(2),
            budget: rand(50..100000),
            location: location.sample,
            user_id: rand(1..10),
            category_id: rand(1..7))
end
