require 'devise'

10.times do
	Registeredapp.create!(
		name: Faker::Lorem.word,
		url: Faker::Internet.url,
		user: User.first
		)
end

20.times do
	Event.create!(
		name: Faker::Lorem.sentence,
		registeredapp: Registeredapp.first
		)
end

puts "Seed finished"
puts "#{Registeredapp.count} registered apps created"
puts "#{Event.count} events created"
