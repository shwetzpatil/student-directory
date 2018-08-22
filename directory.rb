def input_students
  puts "To finish, just hit return twice"
  puts "Student Directory".center(50,"*")
  students = []
  
  puts "Please enter the names of the student"
  name = gets.chomp.capitalize
 
  while !name.empty? do
    puts "Please enter cohort"
    cohort = gets.chomp.capitalize
    puts "Please enter country of birth"
    if cohort.empty?
      cohort = "August"
    end 
    
    country = gets.chomp.capitalize
    puts "Please enter age"
    
    age = gets.chomp.to_i
    students << {name: name, cohort: cohort, country: country, age: age}
    
    puts "Now we have #{students.count} students"
    
    puts "Please enter the name of the student"
    name = gets.chomp.capitalize
  end
  students
end
  
def print_header
  puts "The students of Villain Academy".center(50,"*")
  puts "___________".center(50, "_")
end

def print(names)
  count = 0
  while count < names.length do
    puts " #{count + 1}.#{names[count][:name]}"
    puts "  Cohort : #{names[count][:cohort]} cohort"
    puts "  Country Of Birth : #{names[count][:country]}"
    puts "  Age : #{names[count][:age]}"
    count += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(50, "*")
end
# calling methods
students = input_students
print_header
print(students)
print_footer(students)
