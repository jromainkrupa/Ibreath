require 'date'

Smoke.destroy_all
puts "Smokes destruction...."
User.destroy_all
puts "Users destruction...."

caroline = User.create(
  first_name: 'caroline',
  last_name: 'Janin',
  birth_date: Date.new(1982, 12, 24),
  email: 'caroline.js@icloud.com',
  password: 'azerty'
  )
puts "Caroline creation !"
puts "She's ready for the prepwork"

joseph = User.create(
  first_name: 'Joseph',
  last_name: 'Dupont',
  birth_date: Date.new(1987, 5, 12),
  email: 'joseph.dupont@gmail.com',
  password: 'azerty'
  )

puts "joseph creation !"
puts "let's set Joseph consumption"

# We begin the prepwork for joseph
init_date_time = DateTime.new(2020,8,1,9,00,00)

puts "Day 1 consumption:"
Smoke.create(user:joseph, created_at: init_date_time)
puts "#{joseph.first_name} smokes at: #{Smoke.last.created_at}"

18.times do
  init_date_time += 30.minutes
  Smoke.create(user:joseph, created_at: init_date_time)
  puts "#{joseph.first_name} smokes at: #{Smoke.last.created_at}"
end

puts "Day 2 consumption:"
init_date_time += 1.day - 9.hours + 10.minutes + 3.seconds
22.times do
  init_date_time += 36.minutes
  Smoke.create(user:joseph, created_at: init_date_time)
  puts "#{joseph.first_name} smokes at: #{Smoke.last.created_at}"
end

puts "Day 3 consumption:"
init_date_time += 1.day - 15.hours + 7.minutes + 33.seconds
17.times do
  init_date_time += 56.minutes
  Smoke.create(user:joseph, created_at: init_date_time)
  puts "#{joseph.first_name} smokes at: #{Smoke.last.created_at}"
end

puts "Day 4 consumption:"
init_date_time += 1.day - 12.hours + 12.minutes + 43.seconds
19.times do
  init_date_time += 23.minutes
  Smoke.create(user:joseph, created_at: init_date_time)
  puts "#{joseph.first_name} smokes at: #{Smoke.last.created_at}"
end

puts "Day 5 consumption:"
init_date_time += 1.day - 9.hours + 34.minutes + 13.seconds
16.times do
  init_date_time += 45.minutes
  Smoke.create(user:joseph, created_at: init_date_time)
  puts "#{joseph.first_name} smokes at: #{Smoke.last.created_at}"
end

puts "Day 6 consumption:"
init_date_time += 1.day - 14.hours - 23.minutes + 19.seconds
16.times do
  init_date_time += 51.minutes
  Smoke.create(user:joseph, created_at: init_date_time)
  puts "#{joseph.first_name} smokes at: #{Smoke.last.created_at}"
end

puts "Day 7 consumption:"
init_date_time += 1.day - 13.hours + 13.minutes + 19.seconds
25.times do
  init_date_time += 36.minutes
  Smoke.create(user:joseph, created_at: init_date_time)
  puts "#{joseph.first_name} smokes at: #{Smoke.last.created_at}"
end
puts "////////////////////////////"

puts "Joseph Programm is ready !!!"

puts "////////////////////////////"

program_date_launch = DateTime.new(2020,8,8,7,30,15)
puts "Joseph click on Launch #{program_date_launch}"
total_smoke = Smoke.where(user: joseph).count

day_of_prepwork = (program_date_launch - Smoke.first.created_at.to_datetime).round
puts "Joseph did #{day_of_prepwork} days of prepwork and smoked #{total_smoke}!"
puts "That represent : #{total_smoke * 0.5 } €"
#Program.new(user_id:  joseph, init_smoke: init_smoke, start_time: program_date_launch)

puts "////////////////////////////"
puts "Programm creation"
puts "////////////////////////////"
puts "...."





# initial_date = 1.month.ago

# 25.times do |i|
#   date = initial_date + 1
# end


