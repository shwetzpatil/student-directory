@students = []

def input_students
  puts "To finish, just hit return twice"
  puts "Student Directory".center(50,"*")
  
  while true do
    puts "Please enter the name of the student"
    name = STDIN.gets.chomp.capitalize
    
    if name.empty? 
      break
    end
  
    puts "Please enter cohort"
    cohort = STDIN.gets.chomp
    cohort = valid_cohort(cohort)
    
    puts "Please enter country of birth"
    country = STDIN.gets.chomp.capitalize
    
    puts "Please enter age"
    age = STDIN.gets.chomp.to_i
    
    student_list_data(name, cohort, age, country)
    
    puts "Now we have #{@students.count} students"
  end
  @students
end

def valid_cohort(cohort)
  cohorts = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]

  if cohorts.include?(cohort)
    return cohort
  else 
    return "august"
  end    
end

def student_list_data(name, cohort, age, country)
  @students << {name: name, cohort: cohort, country: country, age: age}
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
    puts "#{"Thanks your input was successfully handled".center(50,"+")}\n\n"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
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
    when "3"
      save_students
    when "4"
      load_students
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

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:age], student[:country]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv") 
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort, age, country = line.chomp.split(',')

  student_list_data(name, valid_cohort(cohort), age, country)
  end
  file.close
end  

def try_load_students
  filename = ARGV.first
  puts filename
  if filename.nil?
    load_students
  elsif File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else 
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

#this piece of code does not run when required in other files(eg. rspec files, directory2.rb)
#this piece of code runs only when it is run as a script (i.e. when run as ruby lib/directory.rb). 
# When you run this file as a script, __FILE__ is the name of the current filename and $0 is the name of the script being run by the ruby command.
# So in this case (i.e. when run as ruby lib/directory.rb), __FILE__ == 'lib/directory.rb' and $0 == 'lib/directory.rb'
if __FILE__==$0
  try_load_students
  interactive_menu
end


