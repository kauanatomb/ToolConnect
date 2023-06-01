require 'faker'
require 'csv'
require 'open-uri'

Tool.destroy_all
User.destroy_all

puts 'Creating 5 fake users...'
5.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
  )
  user.save!
end
puts 'Finished!'

CSV.foreach(Rails.root.join('db/tools.csv'), headers: true) do |row|
  tool = Tool.new({
    name: row[0],
    address: row[1],
    description: row[2],
    availability: row[3],
    user: User.all.sample
  })
  # tool.image.attach( io: File.open("url.png"), filename: "tools.png", content_type: "image/png")
  random_image = URI.open(Faker::LoremFlickr.image(size: "300x200", search_terms: ['tools', tool.name.split.first]))
  tool.photo.attach( io: random_image, filename: "#{tool.name}.png", content_type: "image/png")
  tool.save
end
