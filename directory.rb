@students = []

def input_students
  puts "To finish, just hit return twice"
  puts "Student Directory".center(50,"*")
  cohorts = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
  puts "Please enter the name of the student"
  name = gets.chomp.capitalize
  
  while !name.empty? do
    puts "Please enter cohort"
    cohort = gets.chomp
    puts "Please enter country of birth"
    if cohorts.include? (cohort)
      cohort_val = cohort
    else 
      cohort_val = "august"
    end 
    
    country = gets.chomp.capitalize
    puts "Please enter age"
    
    age = gets.chomp.to_i
    @students << {name: name, cohort: cohort_val, country: country, age: age}
    
    puts "Now we have #{@students.count} students"
    
    puts "Please enter the name of the student"
    name = gets.chomp.capitalize
  end
  @students
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end
  
def print_header
  puts "The students of Villain Academy".center(50,"*")
  puts "___________".center(50, "_")
end

def print_student_list
  if @students.length > 0
    student_hash = {}
    @students.each do |student_with_cohort|
      curr_cohort = student_with_cohort[:cohort] 
      details = [student_with_cohort[:name], student_with_cohort[:country],  student_with_cohort[:age]]
      
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
end

def print_footer
  if @students.count > 1
    puts "Overall, we have #{@students.count} great students".center(50, "*")
  elsif @students.count == 1
    puts "Overall, we have #{@students.count} great student".center(50, "*")
  end
end








# calling methods
# students = input_students
# print_header
# print(students)
# print_footer(students)
interactive_menu

