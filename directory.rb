def input_students
  puts "To finish, just hit return twice"
  puts "Please add details of the students"
  students = []
  puts "Please enter the names of the student"
  name = gets.chomp
 
  while !name.empty? do
    puts "Please enter country of birth"
    country = gets.chomp
    puts "Please enter age"
    age = gets.chomp
    students << {name: name, cohort: :november, country: country, age: age}
    puts "Now we have #{students.count} students"
    puts "Please enter the name of the student"
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
    puts " #{count + 1}. #{names[count][:name]} (#{names[count][:cohort]}) cohort from #{names[count][:country]} of age #{names[count][:age]}."
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
