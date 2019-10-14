# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cities = %w(mtv sjc)
cities.each do |name|
  city = City.create(name: name)
  td = Date.today
  (1..30).to_a.each do |index|
    low = (20..30).to_a.sample(1).first
    high  = low + 10
    a_date = td + index.day
    weather = Weather.new(
      low: low,
      high: high,
      date: a_date
      )

    city.weathers << weather
     puts    city.weathers
    city.save
  end
end


