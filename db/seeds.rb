patrick = User.create first_name: "Patrick", last_name: "Bird", email: "pb@gmail.com", password: "password"

require 'csv'

CSV.foreach(Rails.root.join('db/tools.csv'), headers: true) do |row|
  Tool.create!({
    name: row[0],
    address: row[1],
    description: row[2],
    availability: row[3],
    user_id: patrick.id
  })
end
