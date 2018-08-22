def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
  students << {name: name, cohort: :november}
  puts "Now we have #{students.count} students"
  name = gets.chomp
  end
  students
end
  
def print_header
  puts "The students of Villain Academy"
  puts "--------------"
end

def print(names)
  count = 0
  while count < names.length do
  puts " #{count + 1}. #{names[count][:name]} (#{names[count][:cohort]}) cohort"
  count += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
# calling methods
students = input_students
print_header
print(students)
print_footer(students)
