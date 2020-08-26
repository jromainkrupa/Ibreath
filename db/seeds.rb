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
puts "let's set Joseph prepwork"

# We begin the prepwork for joseph
init_date_time = DateTime.new(2020,8,3,9,00,00)

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

program_date_launch_joseph = DateTime.new(2020,8,10,7,30,15)
total_joseph_smoke = Smoke.where(user: joseph).count
first_joseph_smoke_date = Smoke.where(user: joseph).first.created_at.to_datetime
day_of_prepwork_joseph = (program_date_launch_joseph - first_joseph_smoke_date).round
average_joseph_day_smoke = (total_joseph_smoke / day_of_prepwork_joseph).round
puts "Joseph did #{day_of_prepwork_joseph} days of prepwork and smoked #{total_joseph_smoke}!"
puts "That represent : #{total_joseph_smoke * 0.5 } € and an average smoke of: #{average_joseph_day_smoke} / day "
#Program.new(user_id:  joseph, init_smoke: init_smoke, start_time: program_date_launch_joseph)

puts "////////////////////////////"
puts "Romain creation"
puts "////////////////////////////"
puts "...."

romain = User.create(
  first_name: 'romain',
  last_name: 'Garcia',
  birth_date: Date.new(1984, 6, 3),
  email: 'romain@gmail.com',
  password: 'azerty'
  )
puts "let's set Romain prepwork"
# We begin the prepwork for joseph
init_date_time = DateTime.new(2020,7,6,9,00,00)
puts "Day 1 consumption:"
Smoke.create(user:romain, created_at: init_date_time)
puts "#{romain.first_name} smokes at: #{Smoke.last.created_at}"
15.times do
  init_date_time += 58.minutes
  Smoke.create(user:romain, created_at: init_date_time)
  puts "#{romain.first_name} smokes at: #{Smoke.last.created_at}"
end
puts "Day 2 consumption:"
init_date_time += 1.day - 16.hours + 9.minutes + 30.seconds
20.times do
  init_date_time += 33.minutes
  Smoke.create(user:romain, created_at: init_date_time)
  puts "#{romain.first_name} smokes at: #{Smoke.last.created_at}"
end
puts "Day 3 consumption:"
init_date_time += 1.day - 10.hours + 17.minutes + 34.seconds
15.times do
  init_date_time += 52.minutes
  Smoke.create(user:romain, created_at: init_date_time)
  puts "#{romain.first_name} smokes at: #{Smoke.last.created_at}"
end
puts "Day 4 consumption:"
init_date_time += 1.day - 12.hours + 12.minutes + 43.seconds
13.times do
  init_date_time += 23.minutes
  Smoke.create(user:romain, created_at: init_date_time)
  puts "#{romain.first_name} smokes at: #{Smoke.last.created_at}"
end
puts "Day 5 consumption:"
init_date_time += 1.day - 8.hours + 42.minutes + 13.seconds
16.times do
  init_date_time += 42.minutes
  Smoke.create(user:romain, created_at: init_date_time)
  puts "#{romain.first_name} smokes at: #{Smoke.last.created_at}"
end
puts "Day 6 consumption:"
init_date_time += 1.day - 12.hours - 28.minutes + 19.seconds
13.times do
  init_date_time += 51.minutes
  Smoke.create(user:romain, created_at: init_date_time)
  puts "#{romain.first_name} smokes at: #{Smoke.last.created_at}"
end
puts "Day 7 consumption:"
init_date_time += 1.day - 13.hours + 13.minutes + 19.seconds
12.times do
  init_date_time += 36.minutes
  Smoke.create(user:romain, created_at: init_date_time)
  puts "#{romain.first_name} smokes at: #{Smoke.last.created_at}"
end
puts "////////////////////////////"
puts "romain Programm is ready !!!"
puts "////////////////////////////"
program_date_launch_romain = DateTime.new(2020,7,13,9,30,15)
puts "romain click on Launch #{program_date_launch_romain}"
total_romain_smoke = Smoke.where(user: romain).count
first_romain_smoke_date = Smoke.where(user: romain).first.created_at.to_datetime
day_of_prepwork_romain = (program_date_launch_romain - first_romain_smoke_date).round
average_romain_day_smoke = (total_romain_smoke / day_of_prepwork_romain).round
puts "romain did #{day_of_prepwork_romain} days of prepwork and smoked #{total_romain_smoke}!"
puts "That represent : #{total_romain_smoke * 0.5 } € and an average smoke of: #{average_romain_day_smoke} / day "
#Program.new(user_id:  romain, init_smoke: init_smoke, start_time: program_date_launch_romain)
puts "////////////////////////////"
puts "Programm creation"
puts "////////////////////////////"
puts "...."
romain_program = Program.new(user: romain, start_time: program_date_launch_romain, init_smoke: average_romain_day_smoke)
#romain.user_status = "in_program"
#romain.save
#puts "romain status is now #{romain.user_status}"
puts "romain program has been created"
puts "the current date is #{program_date_launch_romain}"
romain_program_smokes = [average_romain_day_smoke]
30.times do |i|
  romain_program_smokes << (-average_romain_day_smoke.fdiv(30) * (i + 1) + average_romain_day_smoke).round
  i += 1
end
p romain_program_smokes
romain_program_smokes.each_with_index do |smoke, index|
  unless smoke == 0
    puts "Day #{index + 1}: #{smoke} cigarettes with a spread #{(18.fdiv(smoke)*60).round}minutes"
  end
end


