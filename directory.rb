student_count = 11
# list of stuents in array
students = [
    "Dr. Hannibal Lecter",
    "Darth Vader",
    "Nurse Ratched",
    "Micheal Corleone",
    "Alex DeLarge",
    "The Wicked Witch of the West",
    "Terminator",
    "Freddy Krueger",
    "The Joker",
    "Joffrey Baratheon",
    "Norman Bates"
    ]
# list of students
puts "the students of Villain Academy"
puts "--------------"
# puts students[0]
# puts students[1]
# puts students[2]
# puts students[3]
# puts students[4]
# puts students[5]
# puts students[6]
# puts students[7]
# puts students[8]
# puts students[9]
# puts students[10]
students.each do |student|
  puts student
end
# total number of students
puts "Overall, we have #{students.count} great students"
