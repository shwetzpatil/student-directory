def input_students
  puts "To finish, just hit return twice"
  puts "Student Directory".center(50,"*")
  students = []
  cohorts = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
  puts "Please enter the names of the student"
  name = gets.delete!("\n").capitalize
 
  while !name.empty? do
    puts "Please enter cohort"
    cohort = gets.chomp
    puts "Please enter country of birth"
    if cohorts.include? (cohort)
      cohort_val = cohort
    else 
      cohort_val = "august"
    end 
    
    country = gets.delete!("\n").capitalize
    puts "Please enter age"
    
    age = gets.delete!("\n").to_i
    students << {name: name, cohort: cohort_val, country: country, age: age}
    
    puts "Now we have #{students.count} students"
    
    puts "Please enter the name of the student"
    name = gets.delete!("\n").capitalize
  end
  students
end
  
def print_header
  puts "The students of Villain Academy".center(50,"*")
  puts "___________".center(50, "_")
end

def print(names)
  student_hash = {}
  names.each do |student_with_cohort|
    curr_cohort = student_with_cohort[:cohort] 
    details = [student_with_cohort[:name], student_with_cohort[:age], student_with_cohort[:country]]
    
    if student_hash[curr_cohort] == nil
      student_hash[curr_cohort] = [details]
    else
    student_hash[curr_cohort].push(details)
    end
  end
  # puts student_hash
  student_hash.each do |key, value|
    puts "#{key.upcase} Cohort".center(50, "*")
    count = 1
    value.each do |student|
      puts "#{count}"
      puts "Name : #{student[0]}"
      puts "Country of Birth : #{student[1]}"
      puts "Age : #{student[2]}"
      count += 1
    end
  end
  
end

def print_footer(names)
  if names.count > 1
    puts "Overall, we have #{names.count} great students".center(50, "*")
  else
    puts "Overall, we have #{names.count} great student".center(50, "*")
  end
end
# calling methods
students = input_students
print_header
print(students)
print_footer(students)
